import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class MoodPreset extends StatefulWidget {
  const MoodPreset({Key? key}) : super(key: key);

  @override
  State<MoodPreset> createState() => _MoodPresetState();
}

class _MoodPresetState extends State<MoodPreset> {
  String activatedButton = "Themes";

  @override
  Widget build(BuildContext context) {
    ColorPickerProvider _colorPickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
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
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activatedButton = "Themes";
                              });
                            },
                            style: (activatedButton == 'Custom')
                                ? textBtnStyleBlack
                                : textBtnStyleWhite,
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'THEMES',
                                      style: TextStyle(
                                          color: (activatedButton == 'Custom')
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activatedButton = "Custom";
                              });
                            },
                            style: (activatedButton != 'Custom')
                                ? textBtnStyleBlack
                                : textBtnStyleWhite,
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'CUSTOM',
                                      style: TextStyle(
                                          color: (activatedButton != 'Custom')
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _colorPickerProvider.generateColorPickerWidget(
                      activatedButton == 'Themes'
                          ? moodThemesList
                          : moodCustomList,
                      context)),
            ),
          ],
        ));
  }
}
