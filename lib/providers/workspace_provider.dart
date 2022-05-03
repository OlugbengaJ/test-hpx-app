import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';

/// [WorkspaceProvider] handles the workspace events
/// e.g. display certain widgets based on certain events.
class WorkspaceProvider with ChangeNotifier {
  /// [showLighting] determines if the lighting options is displayed.
  bool showLighting = false;

  /// [showStripNotification] indicates if the strip notifcation should be displayed.
  bool showStripNotification = false;

  /// [stripNotificationText] indicates text used by the strip notifcation.
  String stripNotificationText = '';

  void toggleView(WorkspaceView view) {
    if ((showLighting && view == WorkspaceView.workspace) ||
        (!showLighting && view == WorkspaceView.lighting)) {
      showLighting = !showLighting;

      notifyListeners();
    }
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

  DragStartDetails? panStartDetails;
  DragUpdateDetails? panUpdateDetails;
  // bool _isPanComplete = false;
  bool _isPanStarted = false;
  WorkspaceSelectionMode? _mode;
  Size? viewSize;

  bool get isPanning => _isPanStarted;
  WorkspaceSelectionMode? get getMode => _mode;

  void toggleSelectionMode(WorkspaceSelectionMode mode) {
    if (_mode == mode) {
      // reset selection mode
      _mode = null;
    }

    _mode = mode;

    notifyListeners();
  }

  void onPanStart(DragStartDetails details, Size size) {
    // _isPanComplete = false;
    if (_mode == WorkspaceSelectionMode.zone) {
      panStartDetails = details;
      panUpdateDetails =
          DragUpdateDetails(globalPosition: details.globalPosition);
      _isPanStarted = true;
      viewSize = size;

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
    // _isPanComplete = true;
    _isPanStarted = false;

    panStartDetails = null;
    panUpdateDetails = null;

    notifyListeners();
  }

  double? get leftZonePosition {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dx >
        panStartDetails!.localPosition.dx) {
      return panStartDetails!.localPosition.dx;
    }

    return null;
  }

  double? get topZonePosition {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dy >
        panStartDetails!.localPosition.dy) {
      return panStartDetails!.localPosition.dy;
    }

    return null;
  }

  double? get rightZonePosition {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dx <
        panStartDetails!.localPosition.dx) {
      return viewSize!.width - panStartDetails!.localPosition.dx;
    }

    return null;
  }

  double? get bottomZonePosition {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    if (panUpdateDetails!.localPosition.dy <
        panStartDetails!.localPosition.dy) {
      return viewSize!.height - panStartDetails!.globalPosition.dy;
    }

    return null;
  }

  double? get zoneHeight {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    return (panUpdateDetails!.localPosition.dy -
            panStartDetails!.localPosition.dy)
        .abs();
  }

  double? get zoneWidth {
    if (panStartDetails == null || panUpdateDetails == null) return null;

    return (panUpdateDetails!.localPosition.dx -
            panStartDetails!.localPosition.dx)
        .abs();
  }

  bool? isWidgetInZone(RenderBox? box, String k) {
    if (box == null || panUpdateDetails == null || !_isPanStarted) return null;

    final boxRect = box.localToGlobal(Offset.zero) & box.size;
    final selRect = Rect.fromPoints(
        panStartDetails!.globalPosition, panUpdateDetails!.globalPosition);

    final rectIntersect = selRect.intersect(boxRect);

    return (rectIntersect.width >= 0 && rectIntersect.height >= 0);
  }
}
