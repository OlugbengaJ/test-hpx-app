import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/contact_support_model.dart';

// Contact Support provider to manage the contact support process
class ContactSupportWidgetProvider extends ChangeNotifier {
  //// function called when the preset key is pressed
  /// this display a dialog box asking the user to pick from three choice / mode to contact support
  showContactOptionsDialog() {}

  chooseContactType(SupportTypesEnum choice) {
    switch (choice) {
      case SupportTypesEnum.broswer:
        openBrowserSupport();
        break;
      case SupportTypesEnum.audio:
        openAudioCallSupport();
        break;
      case SupportTypesEnum.video:
        openVideoCallSupport();
        break;
      default:
    }
  }

  openBrowserSupport() {}
  openAudioCallSupport() {}
  openVideoCallSupport() {}
}
