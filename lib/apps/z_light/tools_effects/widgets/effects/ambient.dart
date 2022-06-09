import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class AmbeintPreset extends StatefulWidget {
  const AmbeintPreset({Key? key}) : super(key: key);

  @override
  State<AmbeintPreset> createState() => _AmbeintPresetState();
}

class _AmbeintPresetState extends State<AmbeintPreset> {
  final PickerModel _defaultScreenPicker = PickerModel(
      title: 'Entire Screen', enabled: true, value: AmbientEnum.entirescreen);
  final PickerModel _defaultDisplayPicker = PickerModel(
      // title: 'Display 1: X:0, Y:0, W:3840, H:2400',
      title: 'Display 1',
      enabled: true,
      value: AmbientDisplayEnum.display1);

  /// function designed to change the tools and effects sub mode
  changeSubMode(PickerModel? pickerChoice, bool isDisplay) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    modeProvider.setCurrentMode(ToolsModeModel(
        subMode: (isDisplay == false)
            ? pickerChoice?.value
            : modeProvider.currentMode.subMode,
        display: (isDisplay == true)
            ? pickerChoice?.value
            : modeProvider.currentMode.display,
        currentColor: modeProvider.currentMode.currentColor,
        value: modeProvider.currentMode.value,
        icon: modeProvider.currentMode.icon,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  void _setSliderValue(double returnValue) {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);

    effectsProvider.setCurrentEffect(EffectsModel(
      effectName: modeProvider.currentMode.effects.effectName,
      imageQuality: effectsProvider.currentEffect?.imageQuality,
      updatePerSecond: effectsProvider.currentEffect?.updatePerSecond,
    ));
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
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      changeSubMode(returnValue, false);
                    },
                    defaultPicker: _defaultScreenPicker,
                    pickerList: modeProvider.getPickerModes('ambientscreen'))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      changeSubMode(returnValue, true);
                    },
                    defaultPicker: _defaultDisplayPicker,
                    pickerList: modeProvider.getPickerModes('ambientdisplay'))),
            Container(margin: const EdgeInsets.only(top: 30.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 20.0)),
            Text("Image Quality", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: effectsProvider.currentEffect!.imageQuality!,
              max: 100,
              min: 0,
              divisions: 10,
              label: effectsProvider.currentEffect?.imageQuality.toString(),
              onChanged: (double value) {
                setState(() {
                  effectsProvider.currentEffect?.imageQuality = value;
                });
                _setSliderValue(value);
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOW", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("HIGH", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(bottom: 40.0)),
            Text("Updates Per Second",
                textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: effectsProvider.currentEffect!.updatePerSecond!,
              max: 100,
              min: 0,
              divisions: 10,
              label: effectsProvider.currentEffect?.updatePerSecond.toString(),
              onChanged: (double value) {
                setState(() {
                  effectsProvider.currentEffect?.updatePerSecond = value;
                });
                _setSliderValue(value);
              },
            ),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOW", textAlign: TextAlign.left, style: pStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("HIGH", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
          ],
        ));
  }
}
