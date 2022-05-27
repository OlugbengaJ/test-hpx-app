import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class BlinkingPreset extends StatefulWidget {
  const BlinkingPreset({Key? key}) : super(key: key);

  @override
  State<BlinkingPreset> createState() => _BlinkingPresetState();
}

class _BlinkingPresetState extends State<BlinkingPreset> {
  TextEditingController degreeController = TextEditingController();

  void _setSliderValue(double returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    setState(() {
      effectsProvider.setCurrentEffect(EffectsModel(
          effectName: effectsProvider.currentEffect?.effectName,
          degree: effectsProvider.currentEffect?.degree,
          speed: returnValue.floorToDouble()));
      layerProvider.toolsEffectsUpdated();
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
                  value: effectsProvider.currentEffect!.speed!.toDouble(),
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label: effectsProvider.currentEffect!.speed.toString(),
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
