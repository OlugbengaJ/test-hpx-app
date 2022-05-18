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
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
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
    setDefaultMode();
    super.initState();
  }

  Future setDefaultMode() async {
    await Future.delayed(Duration(seconds: 0));
    changeComponent(_defaultPreset);
  }

  changeComponent(PickerModel? pickerChoice) {
    WorkspaceProvider workProvider =
        Provider.of<WorkspaceProvider>(context, listen: false);
    List<Color> currentColors = [];
    setState(() {
      switch (pickerChoice!.value) {
        case "shortcut":
          // workProvider.toggleModal([List<Widget>? children]);
          currentColors.add(Colors.transparent);
          preset = const ShortcutColorsPreset();
          break;
        case "mood":
          currentColors = moodThemesList.first.colorCode;
          preset = const MoodPreset();
          break;
        case "colorsproduction":
          currentColors = colorProductionList.first.colorCode;
          preset = const ColorProductionPreset();
          break;
        case "audiovisualizer":
          audioVisualSolidList.forEach((element) {
            currentColors.add(element.colorCode[0]);
          });
          preset = const AudioVisualPreset();
          break;
        case "wave":
          currentColors = waveCustomList.first.colorCode;
          preset = WavePreset();
          break;
        case "colorcycle":
          colorcycleDefaultsList.first.colorCode.forEach((element) {
            currentColors.add(element);
          });
          preset = const ColorCyclePreset();
          break;
        case "breathing":
          breathingList.forEach((element) {
            currentColors.add(element.colorCode[0]);
          });
          preset = const BreathingPreset();
          break;
        case "blinking":
          blinkingList.forEach((element) {
            currentColors.add(element.colorCode[0]);
          });
          preset = const BlinkingPreset();
          break;
        case "interactive":
          interactiveColorList.forEach((element) {
            currentColors.add(element.colorCode[0]);
          });
          workProvider.toggleStripNotification(
              "Interactive effect will only work with your keyboard. Please assign the keys thatare used for triggering the effect. Hold down the Ctrl key for multiple selection");
          preset = const InteractivePreset();
          break;
        case "image":
          currentColors.add(Colors.transparent);
          preset = const ImagePreset();
          break;
        case "ambient":
          currentColors.add(Colors.transparent);
          preset = const AmbeintPreset();
          break;
        default:
          currentColors.add(Colors.transparent);
          preset = Container();
          break;
      }
    });
    setDefaults(pickerChoice, currentColors);
  }

  setDefaults(PickerModel? returnValue, List<Color> currentColorList) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: currentColorList,
        value: returnValue!.value,
        effects: EffectsModel(effectName: returnValue.value),
        name: returnValue.title));
  }

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider = Provider.of<ModeProvider>(context);
    return Container(
        margin: const EdgeInsets.only(right: 10.0, top: 20.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects", textAlign: TextAlign.left, style: h4Style),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PickerDropdown(
                  onChange: (PickerModel? returnValue) {
                    changeComponent(returnValue);
                  },
                  pickerHintText: "Picker a tool or effect mode ....",
                  pickerList: modeProvider.getPickerModes('mood'),
                  defaultPicker: _defaultPreset,
                )),
            Container(
              margin: const EdgeInsets.only(top: 0.0, bottom: 20.0),
              child: preset,
            ),
          ],
        ));
  }
}
