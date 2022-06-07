import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class InteractivePreset extends StatefulWidget {
  const InteractivePreset({Key? key}) : super(key: key);

  @override
  State<InteractivePreset> createState() => _InteractivePresetState();
}

class _InteractivePresetState extends State<InteractivePreset> {
  final _toolsProvider = ColorPickerProvider();
  TextEditingController degreeController = TextEditingController();
  final _modeProvider = ModeProvider();
  final PickerModel _defaultPicker = PickerModel(
      title: 'Key Wave', enabled: true, value: InteractiveEnum.keywave);

  void _setSliderValue(double returnValue, String type) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effectsProvider.currentEffect?.effectName,
        degree: effectsProvider.currentEffect?.degree,
        speed: (type == 'speed')
            ? returnValue.floorToDouble()
            : effectsProvider.currentEffect?.speed,
        size: (type == 'size')
            ? returnValue.floorToDouble()
            : effectsProvider.currentEffect?.size));
    layerProvider.toolsEffectsUpdated();
  }

  /// function designed to change the tools and effects sub mode
  changeSubMode(PickerModel? pickerChoice) {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    modeProvider.setCurrentMode(ToolsModeModel(
        subMode: pickerChoice?.value,
        currentColor: modeProvider.currentMode.currentColor,
        value: modeProvider.currentMode.value,
        icon: modeProvider.currentMode.icon,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));

    layerProvider.toolsEffectsUpdated();
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      changeSubMode(returnValue);
                    },
                    defaultPicker: _defaultPicker,
                    pickerList:
                        _modeProvider.getPickerModes('interactivesub'))),
            Container(margin: const EdgeInsets.only(bottom: 30.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Wrap(
              children: _toolsProvider
                  .generateColorPickerWidget(interactiveColorList),
            ),
            Container(margin: const EdgeInsets.only(bottom: 50.0)),
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
                _setSliderValue(value, "speed");
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
            Container(margin: const EdgeInsets.only(bottom: 30.0)),
            Text("Size", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: effectsProvider.currentEffect!.size!.toDouble(),
              max: 24,
              min: 0,
              divisions: 24,
              label: effectsProvider.currentEffect!.size.toString(),
              onChanged: (double value) {
                _setSliderValue(value, "size");
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("small", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("large", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
          ],
        ));
  }
}
