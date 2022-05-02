import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';

class WorkspaceProvider with ChangeNotifier {
  /// showLighting determines if the lighting options is displayed.
  bool showLighting = false;

  void toggleView(WorkspaceView view) {
    if ((showLighting && view == WorkspaceView.workspace) ||
        (!showLighting && view == WorkspaceView.lighting)) {
      showLighting = !showLighting;

      notifyListeners();
    }
  }
}
