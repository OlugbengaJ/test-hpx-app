import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/contact_support_model.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:url_launcher/url_launcher.dart';

// Contact Support provider to manage the contact support process
class ContactSupportWidgetProvider extends ChangeNotifier {
  SupportTypesEnum isChoice = SupportTypesEnum.browser;

  //// function called when the preset key is pressed
  /// this display a dialog box asking the user to pick from three choice / mode to contact support
  showContactOptionsDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
              // backgroundColor: Colors.black,
              contentPadding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 30),
              children: [
                Text(
                  'Contact HPX Support Services?',
                  style: h2Style,
                ),
                SizedBox(
                  // height: 150,
                  child: Text(
                    'Please choose an option to connect with our customer support and services?',
                    style: labelStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onHover: (value) {
                          isChoice = SupportTypesEnum.browser;
                        },
                        onPressed: () {
                          chooseContactType(SupportTypesEnum.browser);
                          Navigator.of(context).pop();
                        },
                        style: (isChoice == SupportTypesEnum.browser)
                            ? textBtnStyleSupportActive
                            : textBtnStyleSupportDefault,
                        child: const Text("Via Browser"),
                      ),
                      TextButton(
                        onHover: (value) {
                          isChoice = SupportTypesEnum.audio;
                        },
                        onPressed: () {
                          chooseContactType(SupportTypesEnum.audio);
                          Navigator.of(context).pop();
                        },
                        style: (isChoice == SupportTypesEnum.audio)
                            ? textBtnStyleSupportActive
                            : textBtnStyleSupportDefault,
                        child: const Text("Via Audio Call"),
                      ),
                      TextButton(
                        onHover: (value) {
                          isChoice = SupportTypesEnum.video;
                        },
                        onPressed: () {
                          chooseContactType(SupportTypesEnum.video);
                          Navigator.of(context).pop();
                        },
                        style: (isChoice == SupportTypesEnum.video)
                            ? textBtnStyleSupportActive
                            : textBtnStyleSupportDefault,
                        child: const Text("Via Video Call"),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }

  chooseContactType(SupportTypesEnum choice) async {
    isChoice = choice;
    try {
      switch (choice) {
        case SupportTypesEnum.browser:
          var url = Uri(
              scheme: 'https', host: 'support.hp.com', path: '/us-en/contact/');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw 'Could not launch $url';
          }
          break;
        case SupportTypesEnum.audio:
          break;
        case SupportTypesEnum.video:
          break;
        default:
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
