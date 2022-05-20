import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class AudioVisualPreset extends StatefulWidget {
  const AudioVisualPreset({Key? key}) : super(key: key);

  @override
  State<AudioVisualPreset> createState() => _AudioVisualPresetState();
}

class _AudioVisualPresetState extends State<AudioVisualPreset> {
  String activatedButton = "Solid";
  final PickerModel _defaultPicker = PickerModel(
      title: 'Power Bars',
      enabled: true,
      value: AudioVisualEnum.powerbar,
      icon: Icons.power_input_outlined);

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    ColorPickerProvider _colorPickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      setState(() {
                        // preset = changeComponent();
                      });
                    },
                    defaultPicker: _defaultPicker,
                    pickerList: modeProvider.getPickerModes('audiolist'))),
            Container(margin: const EdgeInsets.only(top: 30.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(top: 20.0)),
            Text("Color Presets", textAlign: TextAlign.left, style: labelStyle),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton == 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton == 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('Solid'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Solid";
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
                            textColor: (activatedButton != 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton != 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: Text('Gradient'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "Gradient";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Wrap(
                  children: _colorPickerProvider.generateColorPickerWidget(
                      activatedButton == 'Gradient'
                          ? audioVisualGradientList
                          : audioVisualSolidList)),
            ),
          ],
        ));
  }
}
