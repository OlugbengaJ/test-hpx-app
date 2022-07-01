import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ContactSupportPreset extends StatefulWidget {
  const ContactSupportPreset({Key? key}) : super(key: key);

  @override
  State<ContactSupportPreset> createState() => _ContactSupportPresetState();
}

class _ContactSupportPresetState extends State<ContactSupportPreset> {
  @override
  Widget build(BuildContext context) {
    ColorPickerProvider colorPickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    // print(modeProvider.currentMode.shortcutKeys);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Key Color", textAlign: TextAlign.left, style: h5Style),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 0),
            child: Wrap(
                children: colorPickerProvider.generateColorPickerWidget(
                    contactsupportlist, context)),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade900),
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Command',
                            textAlign: TextAlign.left, style: labelStyle),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Key', textAlign: TextAlign.left, style: labelStyle),
                    ],
                  ))
                ]),
                Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    margin: const EdgeInsets.only(top: 5, left: 0, right: 10),
                    child: Row(children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Contact Support',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "GoogleSans")),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('FN + F12',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "GoogleSans")),
                        ],
                      ))
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
