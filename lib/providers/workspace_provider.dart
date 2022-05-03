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
  bool isPanComplete = false;
  Size? viewSize;

  void onPanStart(DragStartDetails details, Size size) {
    isPanComplete = false;
    panStartDetails = details;
    viewSize = size;
    notifyListeners();
    // debugPrint(
    //     'drag down global ${details.globalPosition.dy} ${details.globalPosition.dx}');
    // debugPrint(
    //     'drag down local ${details.localPosition.dy} ${details.localPosition.dx}');
    // debugPrint(
    //     'drag down global d= ${details.globalPosition.distance} d2= ${details.globalPosition.distanceSquared}');
    // debugPrint(
    //     'drag down local d= ${details.localPosition.distance} d2= ${details.localPosition.distanceSquared}');
  }

  void onPanUpdate(DragUpdateDetails details) {
    panUpdateDetails = details;

    notifyListeners();
    // debugPrint('drag update delta ${details.delta.dy} ${details.delta.dx}');
    // debugPrint('drag update delta sign ${details.delta.direction.sign}');

    // debugPrint(
    //     'drag update global ${details.globalPosition.dy} ${details.globalPosition.dx}');
    // debugPrint(
    //     'drag update local ${details.localPosition.dy} ${details.localPosition.dx}');
    // debugPrint(
    //     'drag update global d= ${details.globalPosition.distance} d2= ${details.globalPosition.distanceSquared}');
    // debugPrint(
    //     'drag update local d= ${details.localPosition.distance} d2= ${details.localPosition.distanceSquared}');
  }

  void onPanEnd(DragEndDetails details) {
    debugPrint('drag end V= ${details.velocity}');

    // update state and clear unwanted data
    onPanCancel();
  }

  onPanCancel() {
    debugPrint('drag cancel');
    // dragDownDetails = null;
    // dragUpdateDetails = null;
    isPanComplete = true;
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
}
