import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/color_picker.dart';
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
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effectsProvider.currentEffect?.effectName,
        degree: effectsProvider.currentEffect?.degree,
        speed: effectsProvider.currentEffect?.speed,
        size: effectsProvider.currentEffect?.size));

    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: modeProvider.currentMode.currentColor,
        effects: effectsProvider.currentEffect!,
        value: modeProvider.currentMode.value,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  /// function designed to change the tools and effects sub mode
  changeSubMode(PickerModel? pickerChoice) {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effectsProvider.currentEffect?.effectName,
        size: effectsProvider.currentEffect?.size,
        speed: effectsProvider.currentEffect?.speed));
    modeProvider.setCurrentMode(ToolsModeModel(
        subMode: pickerChoice?.value,
        currentColor: modeProvider.currentMode.currentColor,
        value: modeProvider.currentMode.value,
        icon: modeProvider.currentMode.icon,
        effects: effectsProvider.currentEffect!,
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
            ColorPickerWidget(
              context: context,
              color: interactiveColorList[0].colorCode.first,
              colors: interactiveColorList[0].colorCode,
              title: interactiveColorList[0].name,
              label: interactiveColorList[0].label,
              width: interactiveColorList[0].width,
              height: interactiveColorList[0].height,
              picker: interactiveColorList[0].canEdit,
              leftTitle: interactiveColorList[0].action!,
              setRandom: interactiveColorList[1].setRandom!,
              onchange: (colors) {
                resetCurrentColors(colors, 0);
              },
            ),
            ColorPickerWidget(
              context: context,
              color: interactiveColorList[1].colorCode.first,
              colors: interactiveColorList[1].colorCode,
              title: interactiveColorList[1].name,
              label: interactiveColorList[1].label,
              width: interactiveColorList[1].width,
              height: interactiveColorList[1].height,
              picker: interactiveColorList[1].canEdit,
              leftTitle: interactiveColorList[1].action!,
              setRandom: interactiveColorList[1].setRandom!,
              onchange: (colors) {
                resetCurrentColors(colors, 1);
              },
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
              value: effectsProvider.currentEffect!.speed!.roundToDouble(),
              max: 100,
              min: 0,
              divisions: 100,
              label: effectsProvider.currentEffect!.speed.toString(),
              onChanged: (double value) {
                setState(() {
                  effectsProvider.currentEffect?.speed = value;
                });
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
              value: effectsProvider.currentEffect!.size!.roundToDouble(),
              max: 24,
              min: 0,
              divisions: 24,
              label: effectsProvider.currentEffect!.size?.round().toString(),
              onChanged: (double value) {
                setState(() {
                  effectsProvider.currentEffect?.size = value;
                  _setSliderValue(value, "size");
                });
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
