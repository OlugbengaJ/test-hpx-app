import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class BlinkingPreset extends StatefulWidget {
  const BlinkingPreset({Key? key}) : super(key: key);

  @override
  State<BlinkingPreset> createState() => _BlinkingPresetState();
}

class _BlinkingPresetState extends State<BlinkingPreset> {
  TextEditingController degreeController = TextEditingController();
  // Double speed

  void _setSliderValue(double returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);

    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effectsProvider.currentEffect?.effectName,
        speed: effectsProvider.currentEffect?.speed));
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: modeProvider.currentMode.currentColor,
        effects: modeProvider.currentMode.effects,
        value: modeProvider.currentMode.value,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    return Consumer<ColorPickerProvider>(
        builder: (context, colorPickerProviderInstance, child) => Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Wrap(
                //   children: colorPickerProviderInstance
                //       .generateColorPickerWidget(blinkingList),
                // ),
                Wrap(
                  children: [
                    ColorPickerWidget(
                      color: blinkingList[0].colorCode.first,
                      colors: blinkingList[0].colorCode,
                      title: blinkingList[0].name,
                      label: blinkingList[0].label,
                      width: blinkingList[0].width,
                      height: blinkingList[0].height,
                      picker: blinkingList[0].canEdit,
                      setRandom: blinkingList[0].setRandom,
                      leftTitle: blinkingList[0].action!,
                    ),
                    ColorPickerWidget(
                      color: blinkingList[1].colorCode.first,
                      colors: blinkingList[1].colorCode,
                      title: blinkingList[1].name,
                      label: blinkingList[1].label,
                      width: blinkingList[1].width,
                      height: blinkingList[1].height,
                      picker: blinkingList[1].canEdit,
                      setRandom: blinkingList[1].setRandom,
                      leftTitle: blinkingList[1].action!,
                    )
                  ],
                ),
                Container(margin: const EdgeInsets.only(bottom: 10.0)),
                Divider(
                  color: Colors.grey.shade800,
                  height: 1,
                ),
                Container(margin: const EdgeInsets.only(bottom: 20.0)),
                Text("Speed", textAlign: TextAlign.left, style: labelStyle),
                Container(margin: const EdgeInsets.only(bottom: 10.0)),
                Slider(
                  value: effectsProvider.currentEffect!.speed!,
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label: effectsProvider.currentEffect!.speed.toString(),
                  onChanged: (double value) {
                    setState(() {
                      effectsProvider.currentEffect?.speed = value;
                    });
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
              ],
            )));
  }
}
