import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';

/// [WorkspaceProvider] handles the workspace events
/// e.g. display certain widgets based on certain events.
class WorkspaceProvider with ChangeNotifier {
  // bool showLighting = false;

  /// [showStripNotification] indicates if the strip notifcation should be displayed.
  bool showStripNotification = false;

  /// [stripNotificationText] indicates text used by the strip notifcation.
  String stripNotificationText = '';

  /// [_workspaceView] determines if the lighting options is displayed.
  WorkspaceView _workspaceView = WorkspaceView.workspace;

  /// [getWorkspaceView] returns the current view.
  WorkspaceView get getWorkspaceView => _workspaceView;

  bool get isLightingView => _workspaceView == WorkspaceView.lighting;
  bool get isWorkspaceView => _workspaceView == WorkspaceView.workspace;

  void toggleView(WorkspaceView view) {
    _workspaceView = view;

    notifyListeners();
  }

  /// Selection mode is used in zone selection, resizable, or click mode.
  ///
  /// [getMode] returns the current mode of the [Workspace].
  /// Use the [toggleSelectionMode] to change the current mode.
  WorkspaceSelectionMode? get getMode => _keySelectionMode;
  void toggleSelectionMode(WorkspaceSelectionMode mode) {
    if (_keySelectionMode == mode) {
      // reset selection mode
      _keySelectionMode = null;
    } else {
      _keySelectionMode = mode;
    }

    notifyListeners();
  }

  /// Strip notification shows up just right under the Zone Selection and is
  /// intended to display very limited information.
  void toggleStripNotification([String? value]) {
    if (value == null || value.isEmpty) {
      showStripNotification = false;
    } else {
      stripNotificationText = value;
      showStripNotification = true;
    }
    notifyListeners();
  }

  DragDownDetails? panDownDetails;
  DragUpdateDetails? panUpdateDetails;
  WorkspaceSelectionMode? _keySelectionMode;
  Size? _viewSize;

  bool _isPanStarted = false;
  bool get isPanning => _isPanStarted;

  void onPanDown(DragDownDetails details, Size size) {
    if (_keySelectionMode == WorkspaceSelectionMode.zone) {
      debugPrint('size $_viewSize');
      panDownDetails = details;
      panUpdateDetails =
          DragUpdateDetails(globalPosition: details.globalPosition);
      _isPanStarted = true;
      _viewSize = size;

      notifyListeners();
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    panUpdateDetails = details;

    notifyListeners();
  }

  void onPanEnd(DragEndDetails details) {
    // update state and clear unwanted data
    onPanClear();
  }

  onPanClear() {
    _isPanStarted = false;

    panDownDetails = null;
    panUpdateDetails = null;

    notifyListeners();
  }

  double? get leftZonePosition {
    if (panDownDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dx > panDownDetails!.localPosition.dx) {
      return panDownDetails!.localPosition.dx;
    }

    return null;
  }

  double? get topZonePosition {
    if (panDownDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dy > panDownDetails!.localPosition.dy) {
      return panDownDetails!.localPosition.dy;
    }

    return null;
  }

  double? get rightZonePosition {
    if (panDownDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dx < panDownDetails!.localPosition.dx) {
      return _viewSize!.width - panDownDetails!.localPosition.dx;
    }

    return null;
  }

  double? get bottomZonePosition {
    if (panDownDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dy < panDownDetails!.localPosition.dy) {
      return _viewSize!.height - panDownDetails!.localPosition.dy;
    }

    return null;
  }

  double? get zoneHeight {
    if (panDownDetails == null ||
        panUpdateDetails == null ||
        panDownDetails!.globalPosition.dy ==
            panUpdateDetails!.globalPosition.dy) return 0.0;

    return (panUpdateDetails!.localPosition.dy -
            panDownDetails!.localPosition.dy)
        .abs();
  }

  double? get zoneWidth {
    if (panDownDetails == null ||
        panUpdateDetails == null ||
        panDownDetails!.globalPosition.dx ==
            panUpdateDetails!.globalPosition.dx) return 0.0;

    return (panUpdateDetails!.localPosition.dx -
            panDownDetails!.localPosition.dx)
        .abs();
  }

  bool? isWidgetInZone(RenderBox? box, String k) {
    if (box == null || panUpdateDetails == null || !_isPanStarted) return null;

    final boxRect = box.localToGlobal(Offset.zero) & box.size;
    final selRect = Rect.fromPoints(
        panDownDetails!.globalPosition, panUpdateDetails!.globalPosition);

    final rectIntersect = selRect.intersect(boxRect);

    return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
  }
}
