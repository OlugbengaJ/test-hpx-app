import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/rotate_button.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class WavePreset extends StatefulWidget {
  @override
  State<WavePreset> createState() => _WavePresetState();
}

class _WavePresetState extends State<WavePreset> {
  String activatedButton = "DEFAULT";
  TextEditingController degreeController = TextEditingController();
  bool isRotate = false;

  @override
  void initState() {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    degreeController.text =
        effectsProvider.currentEffect.degree!.toStringAsFixed(2);
    super.initState();
  }

  void _setDegreeValue(double? returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ModeProvider _modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    setState(() {
      isRotate = true;
      degreeController.text = (returnValue! < 0
              ? (360 - (0 - returnValue) * (180 / pi))
              : returnValue * (180 / pi))
          .toStringAsFixed(2);

      effectsProvider.setCurrentEffect(EffectsModel(
          effectName: _modeProvider.currentMode.value,
          degree: returnValue < 0
              ? (360 - (0 - returnValue) * (180 / pi))
              : returnValue * (180 / pi),
          speed: effectsProvider.currentEffect.speed));
    });
  }

  void _setSliderValue(double returnValue) {
    ModeProvider _modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    setState(() {
      effectsProvider.defaultWaveEffectValues.speed =
          returnValue.floorToDouble();

      effectsProvider.setCurrentEffect(EffectsModel(
          effectName: _modeProvider.currentMode.value,
          degree: effectsProvider.currentEffect.degree,
          speed: returnValue));
    });
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ColorPickerProvider colorpickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                            textColor: (activatedButton == 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton == 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: Text('DEFAULT'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "DEFAULT";
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
                            textColor: (activatedButton != 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton != 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "CUSTOM";
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
                              colorpickerProvider.generateColorPickerWidget(
                                  activatedButton == 'DEFAULT'
                                      ? waveDefaultsList
                                      : waveCustomList))
                    ])),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 20.0)),
            Text("Speed", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: effectsProvider.defaultWaveEffectValues.speed!.toDouble(),
              max: 100,
              min: 0,
              divisions: 100,
              label: effectsProvider.defaultWaveEffectValues.speed.toString(),
              onChanged: (double value) {
                _setSliderValue(value);
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("0%", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(top: 30.0)),
            Text("Direction", textAlign: TextAlign.left, style: h4Style),
            Container(margin: const EdgeInsets.only(top: 10.0)),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Transform.rotate(
                          angle: 1.6,
                          child: RotateButton(
                              value: double.parse(degreeController.text) % 360,
                              onChange: (double? returnValue) {
                                _setDegreeValue(returnValue);
                              }))),
                  Expanded(
                      child: Column(
                    children: [
                      Text("Degrees (o)",
                          textAlign: TextAlign.left, style: labelStyle),
                      Container(margin: const EdgeInsets.only(top: 10.0)),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: TextField(
                            onSubmitted: (value) {
                              setState(() {
                                if (isRotate == false) {
                                  degreeController.text = value;
                                }
                              });
                            },
                            style: const TextStyle(fontSize: 14),
                            controller: degreeController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ))
                    ],
                  )),
                  const VerticalDivider(
                    width: 10,
                    thickness: 0,
                    indent: 20,
                    endIndent: 0,
                  ),
                  // Expanded(child: Text("o", style: h1Style)),
                ])
          ],
        ));
  }
}
