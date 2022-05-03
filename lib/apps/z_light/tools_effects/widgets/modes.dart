import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/ambient.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/audio_visualization.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/blinking.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/breathing.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/color_cycle.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/image.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/interactive.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/wave.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/color_production.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/moods.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/shortcut_colors.dart';
import 'package:hpx/models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ToolModes extends StatefulWidget {
  const ToolModes({Key? key}) : super(key: key);

  @override
  State<ToolModes> createState() => _ToolModesState();
}

class _ToolModesState extends State<ToolModes> {
  Widget? preset;
  final PickerModel _defaultPreset =
      PickerModel(title: 'Mood', value: 'mood', enabled: true);

  @override
  void initState() {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    modeProvider.currentMode = ToolsModeModel(
        name: _defaultPreset.title,
        effects: [],
        currentColor: [],
        value: _defaultPreset.value);
    // TODO: implement initState
    super.initState();
  }

  changeComponent(PickerModel pickerChoice) {
    switch (pickerChoice.value) {
      case "shortcut":
        return const ShortcutColorsPreset();
      case "mood":
        return const MoodPreset();
      case "colorsproduction":
        return const ColorProductionPreset();
      case "audiovisualizer":
        return const AudioVisualPreset();
      case "wave":
        return WavePreset();
      case "colorcycle":
        return ColorCyclePreset();
      case "breathing":
        return const BreathingPreset();
      case "blinking":
        return const BlinkingPreset();
      case "interactive":
        return const InteractivePreset();
      case "image":
        return const ImagePreset();
      case "ambient":
        return const AmbeintPreset();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeProvider>(
        builder: (context, _modeProvider, child) => Container(
            margin: const EdgeInsets.only(right: 10.0, top: 20.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Tools & Effects",
                    textAlign: TextAlign.left, style: h4Style),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: PickerDropdown(
                      onChange: (PickerModel? returnValue) {
                        _modeProvider.setCurrentMode(ToolsModeModel(
                            name: returnValue!.title,
                            effects: [],
                            currentColor: [],
                            value: returnValue.value));
                        setState(() {
                          preset = changeComponent(returnValue);
                        });
                      },
                      pickerHintText: "Picker a tool or effect mode ....",
                      pickerList: _modeProvider.getPickerModes('mood'),
                      defaultPicker: _defaultPreset,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                  child: preset ?? changeComponent(_defaultPreset),
                ),
              ],
            )));
  }
}
