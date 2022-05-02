import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/widgets/theme.dart';

class MoodPreset extends StatefulWidget {
  @override
  State<MoodPreset> createState() => _MoodPresetState();
}

class _MoodPresetState extends State<MoodPreset> {
  String activatedButton = "Themes";
  final _colorPickerProvider = ColorPickerProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Presets", textAlign: TextAlign.left, style: labelStyle),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton == 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton == 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('THEMES'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Themes";
                              });
                            },
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton != 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton != 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Custom";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                        children:
                            _colorPickerProvider.generateColorPickerWidget(
                                activatedButton == 'Themes'
                                    ? moodThemesList
                                    : moodCustomList))
                  ]),
            ),
          ],
        ));
  }
}
