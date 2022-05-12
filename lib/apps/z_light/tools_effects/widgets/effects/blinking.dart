import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class BlinkingPreset extends StatefulWidget {
  const BlinkingPreset({Key? key}) : super(key: key);

  @override
  State<BlinkingPreset> createState() => _BlinkingPresetState();
}

class _BlinkingPresetState extends State<BlinkingPreset> {
  TextEditingController degreeController = TextEditingController();

  @override
  void initState() {
    setDefaultColors(context);
    // TODO: implement initState
    super.initState();
  }

  Future setDefaultColors(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    List<Color> currentColors = [];
    blinkingList.forEach((element) {
      currentColors.add(element.colorCode[0]);
    });
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: currentColors,
        value: modeProvider.currentMode.value,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));
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
    return Consumer<ColorPickerProvider>(
        builder: (context, colorPickerProviderInstance, child) => Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  children: colorPickerProviderInstance
                      .generateColorPickerWidget(blinkingList),
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
                  value:
                      effectsProvider.defaultWaveEffectValues.speed!.toDouble(),
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label:
                      effectsProvider.defaultWaveEffectValues.speed!.toString(),
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
              ],
            )));
  }
}
