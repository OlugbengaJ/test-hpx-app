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

class BreathingPreset extends StatefulWidget {
  const BreathingPreset({Key? key}) : super(key: key);

  @override
  State<BreathingPreset> createState() => _BreathingPresetState();
}

class _BreathingPresetState extends State<BreathingPreset> {
  final _toolsProvider = ColorPickerProvider();
  TextEditingController degreeController = TextEditingController();

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
        effects: effectsProvider.currentEffect!,
        value: modeProvider.currentMode.value,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  void resetCurrentColors(List<Color> colors, int index) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    modeProvider.currentMode.currentColor[index] = colors.first;
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: modeProvider.currentMode.currentColor,
        value: modeProvider.currentMode.value,
        effects: modeProvider.currentMode.effects,
        icon: modeProvider.currentMode.icon,
        name: modeProvider.currentMode.name));

    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    layerProvider.toolsEffectsUpdated();
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Wrap(
          //   children: _toolsProvider.generateColorPickerWidget(breathingList),
          // ),
          Wrap(
            children: [
              ColorPickerWidget(
                context: context,
                color: breathingList[0].colorCode.first,
                colors: breathingList[0].colorCode,
                title: breathingList[0].name,
                label: breathingList[0].label,
                width: breathingList[0].width,
                height: breathingList[0].height,
                picker: breathingList[0].canEdit,
                leftTitle: breathingList[0].action!,
                setRandom: breathingList[1].setRandom!,
                onchange: (colors) {
                  resetCurrentColors(colors, 0);
                },
              ),
              ColorPickerWidget(
                context: context,
                color: breathingList[1].colorCode.first,
                colors: breathingList[1].colorCode,
                title: breathingList[1].name,
                label: breathingList[1].label,
                width: breathingList[1].width,
                height: breathingList[1].height,
                picker: breathingList[1].canEdit,
                leftTitle: breathingList[1].action!,
                setRandom: breathingList[1].setRandom!,
                onchange: (colors) {
                  resetCurrentColors(colors, 1);
                },
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
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
