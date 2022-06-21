import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ColorCyclePreset extends StatefulWidget {
  const ColorCyclePreset({Key? key}) : super(key: key);

  @override
  State<ColorCyclePreset> createState() => _ColorCycleState();
}

class _ColorCycleState extends State<ColorCyclePreset> {
  String activatedButton = "DEFAULT";
  TextEditingController degreeController = TextEditingController();
  final _colorPickerProvider = ColorPickerProvider();

  void _setSliderValue(double returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effectsProvider.currentEffect?.effectName,
        degree: effectsProvider.currentEffect?.degree,
        speed: returnValue.floorToDouble()));

    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: modeProvider.currentMode.currentColor,
        effects: effectsProvider.currentEffect!,
        value: modeProvider.currentMode.value,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
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
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activatedButton = "DEFAULT";
                              });
                            },
                            style: (activatedButton != 'DEFAULT')
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
                                      'DEFAULT',
                                      style: TextStyle(
                                          color: (activatedButton != 'DEFAULT')
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
                    children: [
                      Wrap(
                          children:
                              _colorPickerProvider.generateColorPickerWidget(
                                  activatedButton == 'DEFAULT'
                                      ? colorcycleDefaultsList
                                      : colorcycleCustomList,
                                  context))
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
              value: effectsProvider.currentEffect!.speed!.roundToDouble(),
              max: 100,
              min: 0,
              divisions: 100,
              label: effectsProvider.currentEffect!.speed?.round().toString(),
              onChanged: (double value) {
                setState(() {
                  effectsProvider.currentEffect?.speed = value;
                  _setSliderValue(value);
                });
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
          ],
        ));
  }
}
