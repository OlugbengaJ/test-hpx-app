import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';

/// [WorkspaceProvider] handles the workspace events
/// e.g. display certain widgets based on certain events.
class WorkspaceProvider with ChangeNotifier {
  bool _isStripNotify = false;

  /// [isStripNotify] indicates if the strip notifcation should be displayed.
  bool get isStripNotify => _isStripNotify;

  /// [stripNotificationText] indicates text used by the strip notifcation.
  String? _stripNotificationText;
  String get stripNotificationText => _stripNotificationText ?? '';

  /// [_workspaceView] determines if the lighting options is displayed.
  WORKSPACE_VIEW _workspaceView = WORKSPACE_VIEW.workspace;

  /// [getWorkspaceView] returns the current view.
  WORKSPACE_VIEW get getWorkspaceView => _workspaceView;

  bool get isLightingView => _workspaceView == WORKSPACE_VIEW.lighting;
  bool get isWorkspaceView => _workspaceView == WORKSPACE_VIEW.workspace;

  void toggleView(WORKSPACE_VIEW view) {
    _workspaceView = view;

    notifyListeners();
  }

  bool get isDragModeClick => _keyDragMode == WORKSPACE_DRAG_MODE.click;
  bool get isDragModeResizable => _keyDragMode == WORKSPACE_DRAG_MODE.resizable;
  bool get isDragModeZone => _keyDragMode == WORKSPACE_DRAG_MODE.zone;

  /// [getMode] returns the current mode of the [Workspace].
  WORKSPACE_DRAG_MODE? get getMode => _keyDragMode;

  /// Selection mode is used in zone selection, resizable, or click mode.
  ///
  /// [toggleDragMode] changes the current mode.
  void toggleDragMode(WORKSPACE_DRAG_MODE mode) {
    if (_keyDragMode == mode) {
      // reset selection mode
      _keyDragMode = null;
    } else {
      _keyDragMode = mode;
    }

    notifyListeners();
  }

  /// Strip notification shows up just right under the Zone Selection and is
  /// intended to display very limited information.
  void toggleStripNotification([String? value]) {
    _isStripNotify = !(value == null || value.isEmpty);
    _stripNotificationText = value;

    notifyListeners();
  }

  DragDownDetails? _panDownDetails;
  DragUpdateDetails? _panUpdateDetails;
  WORKSPACE_DRAG_MODE? _keyDragMode;

  bool _isPanning = false;
  bool get isPanning => _isPanning;

  void onPanDown(DragDownDetails details) {
    if (_keyDragMode == WORKSPACE_DRAG_MODE.zone) {
      _panDownDetails = details;
      _panUpdateDetails =
          DragUpdateDetails(globalPosition: details.globalPosition);
      _isPanning = true;

      notifyListeners();
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    _panUpdateDetails = details;

    notifyListeners();
  }

  void onPanEnd(DragEndDetails details) {
    // update state and clear unwanted data
    onPanClear();
  }

  onPanClear() {
    _isPanning = false;

    _panDownDetails = null;
    _panUpdateDetails = null;

    notifyListeners();
  }

  double? get leftZonePosition {
    if (_panDownDetails == null || _panUpdateDetails == null) return null;

    if (_panUpdateDetails!.localPosition.dx >
        _panDownDetails!.localPosition.dx) {
      return _panDownDetails!.localPosition.dx;
    }

    // mouse drag going left, reset the left to the current offset.dx
    return _panUpdateDetails!.localPosition.dx;
  }

  double? get topZonePosition {
    if (_panDownDetails == null || _panUpdateDetails == null) return null;

    if (_panUpdateDetails!.localPosition.dy >
        _panDownDetails!.localPosition.dy) {
      return _panDownDetails!.localPosition.dy;
    }

    // mouse drag going up, reset the top to the current offset.dy
    return _panUpdateDetails!.localPosition.dy;
  }

  double? get zoneHeight {
    if (_panDownDetails == null ||
        _panUpdateDetails == null ||
        _panDownDetails!.globalPosition.dy ==
            _panUpdateDetails!.globalPosition.dy) return 0.0;

    return (_panUpdateDetails!.localPosition.dy -
            _panDownDetails!.localPosition.dy)
        .abs();
  }

  double? get zoneWidth {
    if (_panDownDetails == null ||
        _panUpdateDetails == null ||
        _panDownDetails!.globalPosition.dx ==
            _panUpdateDetails!.globalPosition.dx) return 0.0;

    return (_panUpdateDetails!.localPosition.dx -
            _panDownDetails!.localPosition.dx)
        .abs();
  }

  bool? isWidgetInZone(RenderBox? box, String k) {
    if (box == null || _panUpdateDetails == null || !_isPanning) return null;

    final boxRect = box.localToGlobal(Offset.zero) & box.size;
    final selRect = Rect.fromPoints(
        _panDownDetails!.globalPosition, _panUpdateDetails!.globalPosition);

    final rectIntersect = selRect.intersect(boxRect);

    return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
  }
}
