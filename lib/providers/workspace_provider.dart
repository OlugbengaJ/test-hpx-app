import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/providers/layers_provider/layers.dart';

/// [WorkspaceProvider] handles the workspace events
/// e.g. display certain widgets based on certain events.
class WorkspaceProvider with ChangeNotifier {
  bool _isStripNotify = false;
  bool _isModalNotify = false;

  /// [isStripNotify] indicates if the strip notifcation should be displayed.
  bool get isStripNotify => _isStripNotify;
  bool get isModalNotify => _isModalNotify;

  /// [stripNotificationText] indicates text used by the strip notifcation.
  String? _stripNotificationText;
  String get stripNotificationText => _stripNotificationText ?? '';

  /// [modalWidgets] indicates widgets used by the modal notifcation.
  List<Widget>? _modalWidgets;
  List<Widget> get modalWidgets => _modalWidgets ?? [];

  /// [_workspaceView] determines if the lighting options is displayed.
  WorkspaceView _workspaceView = WorkspaceView.workspace;

  /// [getWorkspaceView] returns the current view.
  WorkspaceView get getWorkspaceView => _workspaceView;

  bool get isLightingView => _workspaceView == WorkspaceView.lighting;
  bool get isWorkspaceView => _workspaceView == WorkspaceView.workspace;

  /// [toggleView] is used to switch views within the app.
  void toggleView(WorkspaceView view) {
    _workspaceView = view;

    notifyListeners();
  }

  /// [_layersProvider] grants access to [LayersProvider] resizable widget
  LayersProvider? _layersProvider;
  LayersProvider? get getLayersProvider => _layersProvider;
  void setLayersProvider(LayersProvider? v) => _layersProvider = v;

  bool get isDragModeClick => _keyDragMode == WorkspaceDragMode.click;

  bool get isDragModeResizable => _keyDragMode == WorkspaceDragMode.resizable;

  bool get isDragModeZone => _keyDragMode == WorkspaceDragMode.zone;

  /// [getKeyDragMode] returns the current mode of the [Workspace].
  WorkspaceDragMode? get getKeyDragMode => _keyDragMode;

  /// Selection mode is used in zone selection, resizable, or click mode.
  ///
  /// [toggleDragMode] changes the current mode.
  void toggleDragMode(WorkspaceDragMode mode) {
    if (_keyDragMode == mode) {
      // reset selection mode
      _keyDragMode = null;
    } else {
      _keyDragMode = mode;
    }

    if (_layersProvider != null) {
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

  WorkspaceDragMode? _keyDragMode;
  DragDownDetails? _panDownDetails;
  DragUpdateDetails? _panUpdateDetails;

  bool _isPanning = false;
  bool get isPanning => _isPanning;

  /// [onPanDown] indicates the the primary mouse is down and pan started.
  void onPanDown(DragDownDetails details) {
    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
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

  /// [leftZonePosition] calculates the left of the zone selection highlight.
  double? get leftZonePosition {
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

  /// [topZonePosition] calculates the top of the zone selection highlight.
  double? get topZonePosition {
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

  /// [zoneHeight] calculate the zone selection height
  double? get zoneHeight {
    if (_panDownDetails == null ||
        _panUpdateDetails == null ||
        _panDownDetails!.globalPosition.dy ==
            _panUpdateDetails!.globalPosition.dy ||
        !isDragModeZone) return 0.0;

    return (_panUpdateDetails!.localPosition.dy -
            _panDownDetails!.localPosition.dy)
        .abs();
  }

  /// [zoneWidth] calculates the zone selection width
  double? get zoneWidth {
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
  bool? isWidgetInZone(RenderBox? box, {RenderBox? box2}) {
    final Rect selectorRect;

    switch (_keyDragMode) {
      case WorkspaceDragMode.click:
        // prevent keys from being highlighted in click mode.
        if (_panNotAllowed(box) ||
            _panDownDetails!.globalPosition !=
                _panUpdateDetails!.globalPosition) {
          return null;
        }

        selectorRect = _rectFromPanDetails;
        break;
      case WorkspaceDragMode.zone:
        if (_panNotAllowed(box)) return null;

        selectorRect = _rectFromPanDetails;
        break;
      case WorkspaceDragMode.resizable:
        if (_layersProvider == null || _layersProvider!.length <= 0) {
          return null;
        }

        // calculate rect based on resizable widget offsets.
        final layerModel = _layersProvider!.getItem(_layersProvider!.index);
        box2 = layerModel.controller.draggableKey.currentContext
            ?.findRenderObject() as RenderBox?;

        if (box2 == null) return null;
        selectorRect = box2.localToGlobal(Offset.zero) & box2.size;

        break;

      default:
        return null;
    }

    final Rect boxRect = box!.localToGlobal(Offset.zero) & box.size;
    final rectIntersect = selectorRect.intersect(boxRect);

    return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
  }

  // TODO: this is a debug implementation and must be refactored for production.
  // send random color to animate
  List<Color> get animColors => [colorRandom];
}

Color get colorRandom => Color(0xffffffff & Random().nextInt(0xffffffff));
