import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/selection_offset.dart';
import 'package:hpx/providers/layers_provider/layers.dart';

/// [WorkspaceProvider] handles the workspace events.
///
/// e.g. display certain widgets based on certain events.
class WorkspaceProvider with ChangeNotifier {
  bool _isStripNotify = false;
  bool _isModalNotify = false;

  /// [_stripNotificationText] holds text used by the strip notifcation.
  String? _stripNotificationText;

  /// [_modalWidgets] holds widgets that are rendered in the modal notifcation.
  List<Widget>? _modalWidgets;

  /// [isStripNotify] returns if strip notifcation is displayed.
  bool get isStripNotify => _isStripNotify;

  /// [isModalNotify] returns if modal notifcation is displayed.
  bool get isModalNotify => _isModalNotify;

  /// [stripNotificationText] returns the strip notification text
  /// or an empty string when empty.
  String get stripNotificationText => _stripNotificationText ?? '';

  /// [modalWidgets] indicates widgets used by the modal notifcation.
  List<Widget> get modalWidgets => _modalWidgets ?? [];

  /// [_workspaceView] indicates the current view in focus.
  WorkspaceView _workspaceView = WorkspaceView.lighting;

  /// [getWorkspaceView] returns the current view.
  WorkspaceView get getWorkspaceView => _workspaceView;

  /// [isLightingView] returns a boolean.
  /// Checks if the current view is [WorkspaceView.lighting].
  bool get isLightingView => _workspaceView == WorkspaceView.lighting;

  /// [isWorkspaceView] returns a boolean.
  /// Checks if the current view is [WorkspaceView.workspace].
  bool get isWorkspaceView => _workspaceView == WorkspaceView.workspace;

  /// [toggleView] is used to switch views within the app.
  void toggleView(WorkspaceView view) {
    _workspaceView = view;

    notifyListeners();
  }

  /// Animation controls
  /// should contain a list of animations for different layers.
  // late AnimationController _controller;
  // late Animation<double> _animation;

  // Animation<double> get animation => _animation;
  // AnimationController get controller => _controller;

  // void setAnimation(
  //     AnimationController controller, Animation<double> animation) {
  //   _controller = controller;
  //   _animation = animation;
  //   // _controller.forward();
  // }

  // void stopAnimating() {
  //   if (_controller.isAnimating) {
  //     _controller.stop();
  //   }
  // }

  ResizableProvider? _resizableProvider;

  /// [_layersProvider] grants access to [LayersProvider] resizable widget
  LayersProvider? _layersProvider;
  LayersProvider? get getLayersProvider => _layersProvider;

  void initLayersProvider(LayersProvider? v) {
    _layersProvider = v;
  }

  void initResizableProvider(ResizableProvider? r) {
    _resizableProvider = r;
  }

  WorkspaceDragMode? _keyDragMode = WorkspaceDragMode.resizable;

  bool get isDragModeClick => _keyDragMode == WorkspaceDragMode.click;

  bool get isDragModeResizable => _keyDragMode == WorkspaceDragMode.resizable;

  bool get isDragModeZone => _keyDragMode == WorkspaceDragMode.zone;

  /// [getKeyDragMode] returns the current mode of the [Workspace].
  WorkspaceDragMode? get getKeyDragMode => _keyDragMode;
  bool _dragModeChanged = false;
  bool _isCurrentDeviceSelected = false;

  /// [toggleDragMode] changes the current selection mode.
  ///
  /// Selection mode is used in zone selection, resizable, or click mode.
  void toggleDragMode(WorkspaceDragMode mode) {
    if (_keyDragMode == mode) {
      // reset selection mode
      _keyDragMode = null;
      _dragModeChanged = false;
    } else {
      _keyDragMode = mode;
      _dragModeChanged = true;
    }

    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
        // set to true to enable selection of the entire keys
        _isCurrentDeviceSelected = true;
        _dragModeChanged = false;
        break;
      default:
        _isCurrentDeviceSelected = false;
    }
    // drag mode has changed
    _dragModeChanged = true;

    if (_layersProvider != null) {
      // toggle resizable visibility for the active layer.
      _layersProvider!.toggleHideStackedLayers(!isDragModeResizable);
    }

    notifyListeners();
  }

  /// [toggleStripNotification] is used to hide or show a notification.
  ///
  /// The Strip notification shows up right under the Zone Selection and is
  /// intended to display very limited information.
  /// Passing empty [message] hides the modal.
  void toggleStripNotification([String? message]) {
    _isStripNotify = !(message == null || message.isEmpty);
    _stripNotificationText = message;

    notifyListeners();
  }

  /// [toggleModal] is used to hide or show a modal notification.
  ///
  /// The modal notification shows up right at the center of the screen.
  /// Passing empty [children] hides the modal.
  void toggleModal([List<Widget>? children]) {
    _isModalNotify = !(children == null || children.isEmpty);
    _modalWidgets = children;

    notifyListeners();
  }

  DragDownDetails? _panDownDetails;
  DragUpdateDetails? _panUpdateDetails;

  bool _isPanning = false;
  bool get isPanning => _isPanning;

  /// [onPanDown] indicates the the primary mouse is down and pan started.
  void onPanDown(DragDownDetails details) {
    // drag mode has changed, clear selection
    _dragModeChanged = false;

    switch (_keyDragMode) {
      // case WorkspaceDragMode.click:
      case WorkspaceDragMode.zone:
        _panDownDetails = details;
        _panUpdateDetails =
            DragUpdateDetails(globalPosition: details.globalPosition);
        _isPanning = true;

        notifyListeners();
        break;
      case WorkspaceDragMode.resizable:
        notifyListeners();
        break;
      default:
    }
  }

  /// [onPanUpdate] indicates the current position of the pan.
  void onPanUpdate(DragUpdateDetails details) {
    _panUpdateDetails = details;

    notifyListeners();
  }

  /// [onPanEnd] indicates the primary mouse is up and the end of pan.
  void onPanEnd(DragEndDetails details) {
    // update state and clear unwanted data
    onPanClear();
  }

  /// [onPanClear] resets variables used to indicate pan in progress.
  void onPanClear() {
    _isPanning = false;
    _panDownDetails = null;
    _panUpdateDetails = null;

    notifyListeners();
  }

  /// [zoneL] calculates the left of the zone selection highlight.
  double? get zoneL {
    if (_panDownDetails == null) return null;

    // disable highlight in zone mode
    if (!isDragModeZone) return _panDownDetails!.localPosition.dx;

    if (_panDownDetails == null || _panUpdateDetails == null) return null;

    if (_panUpdateDetails!.localPosition.dx >
        _panDownDetails!.localPosition.dx) {
      return _panDownDetails!.localPosition.dx;
    }

    // mouse drag going left, reset the left to the current offset.dx
    return _panUpdateDetails!.localPosition.dx;
  }

  /// [zoneT] calculates the top of the zone selection highlight.
  double? get zoneT {
    if (_panDownDetails == null) return null;

    // disable highlight in zone mode
    if (!isDragModeZone) return _panDownDetails!.localPosition.dx;

    if (_panDownDetails == null || _panUpdateDetails == null) return null;

    if (_panUpdateDetails!.localPosition.dy >
        _panDownDetails!.localPosition.dy) {
      return _panDownDetails!.localPosition.dy;
    }

    // mouse drag going up, reset the top to the current offset.dy
    return _panUpdateDetails!.localPosition.dy;
  }

  /// [zoneH] calculate the zone selection height
  double? get zoneH {
    if (_panDownDetails == null ||
        _panUpdateDetails == null ||
        _panDownDetails!.globalPosition.dy ==
            _panUpdateDetails!.globalPosition.dy ||
        !isDragModeZone) return 0.0;

    return (_panUpdateDetails!.localPosition.dy -
            _panDownDetails!.localPosition.dy)
        .abs();
  }

  /// [zoneW] calculates the zone selection width
  double? get zoneW {
    if (_panDownDetails == null ||
        _panUpdateDetails == null ||
        _panDownDetails!.globalPosition.dx ==
            _panUpdateDetails!.globalPosition.dx ||
        !isDragModeZone) return 0.0;

    return (_panUpdateDetails!.localPosition.dx -
            _panDownDetails!.localPosition.dx)
        .abs();
  }

  /// [_panNotAllowed] checks if [object] exists and mouse is panning.
  bool _panNotAllowed(Object? object) {
    return (object == null || _panUpdateDetails == null || !_isPanning);
  }

  /// [_rectFromPanDetails] returns a Rect
  /// from [_panDownDetails] and [_panUpdateDetails].
  Rect get _rectFromPanDetails => Rect.fromPoints(
      _panDownDetails!.globalPosition, _panUpdateDetails!.globalPosition);

  /// [isWidgetInZone] checks a widget intersects with the zone selection
  bool? isWidgetInZone(RenderBox? box, {RenderBox? box2, String k = ''}) {
    // drag mode has changed, unselect box
    if (_dragModeChanged) return false;

    final Rect selectorRect;

    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
        return _isCurrentDeviceSelected ? true : null;

      // // prevent keys from being highlighted in click mode.
      // if (_panNotAllowed(box) ||
      //     _panDownDetails!.globalPosition !=
      //         _panUpdateDetails!.globalPosition) {
      //   return null;
      // }

      // selectorRect = _rectFromPanDetails;
      // break;
      case WorkspaceDragMode.zone:
        if (_panNotAllowed(box)) return null;

        selectorRect = _rectFromPanDetails;
        break;
      // TODO: Resizable is buggy
      // 1. new layer should show resizable
      // 2. each layer should show resizable and keep it's state
      case WorkspaceDragMode.resizable:
        if (_layersProvider == null || _layersProvider!.length <= 0) {
          return null;
        }

        // calculate rect based on resizable widget offsets.
        _resizableProvider?.calculateSizeFromLocal();
        box2 = _resizableProvider!.draggableKey.currentContext
            ?.findRenderObject() as RenderBox?;

        if (box2 == null) return null;

        selectorRect = box2.localToGlobal(Offset.zero) & box2.size;
        break;

      default:
        return null;
    }

    final Rect boxRect = box!.localToGlobal(Offset.zero) & box.size;
    final rectIntersect = selectorRect.intersect(boxRect);

    // debugPrint('$_dragModeChanged, $_keyDragMode');
    if (k.contains('kEsc')) {
      debugPrint('$k $boxRect $selectorRect $rectIntersect');
    }

    // include 0 for scenarios where a button is clicked.
    return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
  }

  /// Each layer selections need to be maintained so the user can switch
  /// from back and forth from highlight selection to rezisable, or simply
  /// shortcut keys selection .
  ///
  /// In this case, we would need to store offset information such as
  ///
  /// * highlightLTWH: to track the highlight offsets of a layer
  ///
  /// * resizableLTWH: to track the resizable offsets for a layer

  late Map<String, SelectionOffset> layersLTWH = {};

  int get currentLayerId =>
      _layersProvider!.layeritems[_layersProvider!.listIndex].id;

  SelectionOffset? getLayerLTWH(int id) => layersLTWH['$id'];

  void initLayerLTWH() {
    if (_layersProvider?.layeritems == null) return;

    for (var layer in _layersProvider!.layeritems) {
      SelectionOffset? layerLTWH = getLayerLTWH(layer.id);

      if (layerLTWH == null) {
        // layer does not exist, hence add it
        layerLTWH = SelectionOffset()
          ..id = '${layer.id}'
          ..dragMode = WorkspaceDragMode.resizable
          ..highlightLTWH = LTWH(zoneL, zoneT, zoneW, zoneH);
      } else {
        // layer exist but need to reinsert as it's index may have changed.
        deleteLayerLTWH(layer.id);
      }

      // add the layerLTHW to the map.
      addLayerLTWH(layerLTWH);
    }
  }

  void addLayerLTWH(SelectionOffset layerLTWH) {
    layersLTWH.putIfAbsent(layerLTWH.id, () => layerLTWH);
  }

  void deleteLayerLTWH(int id) {
    layersLTWH.remove('$id');
  }

  void setLayerDragMode() {
    // find the layer LTWH
    final ltwh = getLayerLTWH(currentLayerId);

    ltwh?.dragMode = _keyDragMode;
  }

  void setLayerLTWH() {
    // find the layer LTWH
    final ltwh = getLayerLTWH(currentLayerId);

    if (isDragModeResizable && ltwh != null) {
      ltwh.highlightLTWH ??= LTWH(zoneL, zoneT, zoneW, zoneH);

      ltwh.highlightLTWH?.left = zoneL;
      ltwh.highlightLTWH?.top = zoneT;
      ltwh.highlightLTWH?.width = zoneW;
      ltwh.highlightLTWH?.height = zoneH;
    }
  }
}
