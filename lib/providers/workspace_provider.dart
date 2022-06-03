import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/workspace/widgets/overlay_selector.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/selection_offset.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/common.dart';

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

  /// [_selectorVisible] determines overlay selectors visibility.
  bool _selectorVisible = false;

  final double _resizableThreshold = 50;
  bool get selectorVisible => _selectorVisible;

  /// [_workspaceRect] returns a [Rect] of the rendered workspace stack.
  ///
  /// This is necessary to determine the overlay selector's global position.
  Rect get _workspaceRect {
    final workspaceRender =
        workspaceKey.currentContext?.findRenderObject() as RenderBox?;

    return workspaceRender!.localToGlobal(Offset.zero) & workspaceRender.size;
  }

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

  bool _isPanning = true;

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

  /// [_layersProvider] grants access to [LayersProvider] resizable widget
  LayersProvider? _layersProvider;
  LayersProvider? get getLayersProvider => _layersProvider;

  void initLayersProvider(LayersProvider? v) {
    _layersProvider = v;

    // initialize the layers selections
    initLayerLTWH();
  }

  WorkspaceDragMode? _keyDragMode = WorkspaceDragMode.resizable;

  bool get isDragModeClick => _keyDragMode == WorkspaceDragMode.click;

  bool get isDragModeResizable => _keyDragMode == WorkspaceDragMode.resizable;

  bool get isDragModeHighlight => _keyDragMode == WorkspaceDragMode.highlight;

  /// [getKeyDragMode] returns the current mode of the [Workspace].
  WorkspaceDragMode? get getKeyDragMode => _keyDragMode;
  bool _isCurrentDeviceSelected = false;

  /// [toggleDragMode] changes the current selection mode.
  void toggleDragMode(WorkspaceDragMode mode) {
    if (_keyDragMode == mode) {
      // reset selection mode
      _keyDragMode = null;
    } else {
      _keyDragMode = mode;
    }

    // hide the overlay selector
    _selectorVisible = false;

    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
        // set to true to enable selection of the entire keys
        _isCurrentDeviceSelected = true;

        break;
      case WorkspaceDragMode.resizable:
        // show the overlay selector
        _selectorVisible = true;
        _isPanning = true;

        // set the current layer's drag mode
        getLayerLTWH(currentLayerId)!.dragMode = WorkspaceDragMode.resizable;

        break;
      case WorkspaceDragMode.highlight:
        // set the current layer's drag mode
        getLayerLTWH(currentLayerId)!.dragMode = WorkspaceDragMode.highlight;
        _isPanning = false;

        break;

      default:
        _isCurrentDeviceSelected = false;
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

  /// [toggleModal] hides or shows a modal notification.
  ///
  /// The modal notification shows up right at the center of the screen.
  /// Passing no argument or empty [children] hides the modal.
  void toggleModal([List<Widget>? children]) {
    _isModalNotify = !(children == null || children.isEmpty);
    _modalWidgets = children;

    notifyListeners();
  }

  DragDownDetails? _panDownDetails;
  DragUpdateDetails? _panUpdateDetails;

  /// [onPanDown] indicates the the primary mouse is down and pan started.
  void onPanDown(DragDownDetails details, [DraggableRegionName? handleName]) {
    if (_keyDragMode == WorkspaceDragMode.highlight) {
      _panDownDetails = details;
      _panUpdateDetails =
          DragUpdateDetails(globalPosition: details.globalPosition);

      _isPanning = !_isPanning;
    }
  }

  /// [onPanUpdate] indicates the current position of the pan.
  void onPanUpdate(DragUpdateDetails details,
      [DraggableRegionName? handleName]) {
    // no drag mode so don't update overlay selector.
    if (_keyDragMode == null) return;

    // get the current layer
    final ltwh = getLayerLTWH(currentLayerId)!;

    if (isDragModeHighlight) {
      ltwh.highlightLTWH!.left = _dragL;
      ltwh.highlightLTWH!.top = _dragT;
      ltwh.highlightLTWH!.width = _dragW;
      ltwh.highlightLTWH!.height = _dragH;

      _selectorVisible = true;
    } else if (isDragModeResizable && handleName != null) {
      // check the name of the handle then update the
      // overlay selector's position.

      switch (handleName) {
        case DraggableRegionName.center:

          // moving the entire selector hence update left and top.
          ltwh.resizableLTWH!.left =
              (ltwh.resizableLTWH!.left ?? 0) + details.delta.dx;
          ltwh.resizableLTWH!.top =
              (ltwh.resizableLTWH!.top ?? 0) + details.delta.dy;
          break;
        case DraggableRegionName.topLeft:

          // resize from top-left, update selector's left, top, width, and height.
          final top = (ltwh.resizableLTWH!.top ?? 0) + details.delta.dy;
          final left = (ltwh.resizableLTWH!.left ?? 0) + details.delta.dx;
          final width = (ltwh.resizableLTWH!.width ?? 0) - details.delta.dx;
          final height = (ltwh.resizableLTWH!.height ?? 0) - details.delta.dy;

          // width must be greater than threshold
          if (width >= _resizableThreshold) {
            ltwh.resizableLTWH!.left = left;
            ltwh.resizableLTWH!.width = width;
          }

          // height must be greater than threshold
          if (height >= _resizableThreshold) {
            ltwh.resizableLTWH!.top = top;
            ltwh.resizableLTWH!.height = height;
          }
          break;
        case DraggableRegionName.topRight:

          // resize from top-right, update selector's top, width, and height.
          final top = (ltwh.resizableLTWH!.top ?? 0) + details.delta.dy;
          final width = (ltwh.resizableLTWH!.width ?? 0) + details.delta.dx;
          final height = (ltwh.resizableLTWH!.height ?? 0) - details.delta.dy;

          // width must be greater than threshold
          if (width >= _resizableThreshold) {
            ltwh.resizableLTWH!.width = width;
          }

          // height must be greater than threshold
          if (height >= _resizableThreshold) {
            ltwh.resizableLTWH!.top = top;
            ltwh.resizableLTWH!.height = height;
          }
          break;
        case DraggableRegionName.bottomRight:

          // resize from bottom-right, update selector's width and height.
          final width = (ltwh.resizableLTWH!.width ?? 0) + details.delta.dx;
          final height = (ltwh.resizableLTWH!.height ?? 0) + details.delta.dy;

          // width must be greater than threshold
          if (width >= _resizableThreshold) {
            ltwh.resizableLTWH!.width = width;
          }

          // height must be greater than threshold
          if (height >= _resizableThreshold) {
            ltwh.resizableLTWH!.height = height;
          }
          break;
        case DraggableRegionName.bottomLeft:

          // resize from bottom-left, update selector's left, width, and height.
          final left = (ltwh.resizableLTWH!.left ?? 0) + details.delta.dx;
          final width = (ltwh.resizableLTWH!.width ?? 0) - details.delta.dx;
          final height = (ltwh.resizableLTWH!.height ?? 0) + details.delta.dy;

          // width must be greater than threshold
          if (width >= _resizableThreshold) {
            ltwh.resizableLTWH!.left = left;
            ltwh.resizableLTWH!.width = width;
          }

          // height must be greater than threshold
          if (height >= _resizableThreshold) {
            ltwh.resizableLTWH!.height = height;
          }
          break;
        default:
      }
    }
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
    if (isDragModeHighlight) {
      _isPanning = false;
      _selectorVisible = false;
    }

    notifyListeners();
  }

  /// [zoneL] calculates the zone selection left.
  double? get zoneL {
    // return the current layer selection
    switch (_keyDragMode) {
      case WorkspaceDragMode.resizable:
        return getLayerLTWH(currentLayerId)?.resizableLTWH?.left;
      case WorkspaceDragMode.highlight:
        return getLayerLTWH(currentLayerId)?.highlightLTWH?.left;
      default:
        return null;
    }
  }

  /// [_dragL] calculate the left in drag mode highlight.
  double get _dragL {
    if (_panUpdateDetails!.localPosition.dx >
        _panDownDetails!.localPosition.dx) {
      // mouse drag going right
      return _panDownDetails!.localPosition.dx;
    }

    // mouse drag going left, reset the left to the current offset.dx
    return _panUpdateDetails!.localPosition.dx;
  }

  /// [zoneT] calculates the zone selection top.
  double? get zoneT {
    switch (_keyDragMode) {
      case WorkspaceDragMode.resizable:
        return getLayerLTWH(currentLayerId)?.resizableLTWH?.top;
      case WorkspaceDragMode.highlight:
        return getLayerLTWH(currentLayerId)?.highlightLTWH?.top;
      default:
        return null;
    }
  }

  /// [_dragT] calculate the top in drag mode highlight.
  double get _dragT {
    if (_panUpdateDetails!.localPosition.dy >
        _panDownDetails!.localPosition.dy) {
      // mouse drag going down
      return _panDownDetails!.localPosition.dy;
    }

    // mouse drag going up, reset the top to the current offset.dy
    return _panUpdateDetails!.localPosition.dy;
  }

  /// [zoneH] calculate the zone selection height
  double? get zoneH {
    switch (_keyDragMode) {
      case WorkspaceDragMode.resizable:
        return getLayerLTWH(currentLayerId)?.resizableLTWH?.height;
      case WorkspaceDragMode.highlight:
        return getLayerLTWH(currentLayerId)?.highlightLTWH?.height;
      default:
        return null;
    }
  }

  /// [_dragH] calculate the height in drag mode highlight.
  double get _dragH {
    if (_panDownDetails!.globalPosition.dy ==
        _panUpdateDetails!.globalPosition.dy) {
      return 0.0;
    }

    return subtractAbs(
        _panUpdateDetails!.localPosition.dy, _panDownDetails!.localPosition.dy);
  }

  /// [zoneW] calculates the zone selection width
  double? get zoneW {
    switch (_keyDragMode) {
      case WorkspaceDragMode.resizable:
        return getLayerLTWH(currentLayerId)?.resizableLTWH?.width;
      case WorkspaceDragMode.highlight:
        return getLayerLTWH(currentLayerId)?.highlightLTWH?.width;
      default:
        return null;
    }
  }

  /// [_dragW] calculate the width in drag mode highlight.
  double get _dragW {
    if (_panDownDetails!.globalPosition.dx ==
        _panUpdateDetails!.globalPosition.dx) return 0.0;

    return subtractAbs(
        _panUpdateDetails!.localPosition.dx, _panDownDetails!.localPosition.dx);
  }

  /// [isWidgetInZone] checks a widget intersects with the zone selection
  bool? isWidgetInZone(RenderBox? box, {RenderBox? box2, String k = ''}) {
    final Rect selectorRect;

    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
        return _isCurrentDeviceSelected ? true : null;

      default:
        final ltwh = getLayerLTWH(currentLayerId);

        if (ltwh != null) {
          // check the last drag mode used and paint widget with LTWH.
          // LTWH used by the overlay selectors uses local offsets, hence the
          // need to add workspace left and top to get their global offsets.
          if (ltwh.dragMode == WorkspaceDragMode.resizable) {
            selectorRect = Rect.fromLTWH(
              ltwh.resizableLTWH!.left! + _workspaceRect.left,
              ltwh.resizableLTWH!.top! + _workspaceRect.top,
              ltwh.resizableLTWH!.width!,
              ltwh.resizableLTWH!.height!,
            );
          } else {
            selectorRect = Rect.fromLTWH(
              ltwh.highlightLTWH!.left! + _workspaceRect.left,
              ltwh.highlightLTWH!.top! + _workspaceRect.top,
              ltwh.highlightLTWH!.width!,
              ltwh.highlightLTWH!.height!,
            );
          }
          final Rect boxRect = box!.localToGlobal(Offset.zero) & box.size;
          final rectIntersect = selectorRect.intersect(boxRect);

          // debugPrint('$_dragModeChanged, $_keyDragMode');
          if (k.contains('kF5')) {
            // final g = workspaceKey.currentContext?.findRenderObject() as RenderBox?;
            // final s = g!.localToGlobal(Offset.zero);
            // debugPrint('$k $s');
            // debugPrint('$k $boxRect $selectorRect $rectIntersect');
          }

          // include 0 for scenarios where a button is clicked.
          return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
        }

        return null;
    }
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

  int? get currentLayerId {
    if (_layersProvider!.layeritems.isEmpty) return null;
    return _layersProvider!.layeritems[_layersProvider!.listIndex].id;
  }

  SelectionOffset? getLayerLTWH(int? id) {
    if (id == null) return null;
    return layersLTWH['$id'];
  }

  void initLayerLTWH() {
    if (_layersProvider?.layeritems == null) return;

    for (var layer in _layersProvider!.layeritems) {
      SelectionOffset? layerLTWH = getLayerLTWH(layer.id);

      if (layerLTWH == null) {
        // layer does not exist, hence set the LTWH to defaults
        // get the workspace stack via its global key and use its size

        final left = _workspaceRect.size.width / 2;
        final top = _workspaceRect.size.height / 2;
        const double halfSize = 100.0;

        // actual size of the overlay
        const double size = halfSize * 2;

        layerLTWH = SelectionOffset()
          ..id = '${layer.id}'
          ..dragMode = WorkspaceDragMode.resizable
          ..highlightLTWH = LTWH(0.0, 0.0, 0.0, 0.0)
          ..resizableLTWH = LTWH(left - halfSize, top - halfSize, size, size);
      } else {
        // layer exist but need to reinsert as it's index may have changed.
        deleteLayerLTWH(layer.id);
      }

      // add the layerLTHW to the map.
      addLayerLTWH(layerLTWH);

      if (currentLayerId == layer.id) {
        // set workspace drag mode to the current layer's last drag mode
        if (_keyDragMode != null) {
          _keyDragMode = getLayerLTWH(currentLayerId)?.dragMode;
        }

        if (isDragModeResizable) {
          // show the selector when drag mode is resizeable.
          _selectorVisible = true;
        } else if (_keyDragMode == null) {
          // hide the selector when drag mode is null.
          _selectorVisible = false;
        } else {
          // show the selector when drag mode is highlight.
          _selectorVisible = _isPanning;
        }
      }
    }

    // set overlay selector visibility in resize mode
    // if (isDragModeResizable) {
    //   _selectorVisible = true;
    // } else {
    //   _selectorVisible = false;
    // }
  }

  void addLayerLTWH(SelectionOffset layerLTWH) {
    layersLTWH.putIfAbsent(layerLTWH.id, () => layerLTWH);
  }

  void deleteLayerLTWH(int id) {
    layersLTWH.remove('$id');
  }

  void setLayerDragMode() {
    // find the layer LTWH
    final ltwh = getLayerLTWH(currentLayerId!);

    ltwh?.dragMode = _keyDragMode;
  }
}
