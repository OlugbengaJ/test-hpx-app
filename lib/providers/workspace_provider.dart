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
}
