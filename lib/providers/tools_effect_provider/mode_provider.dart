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
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

// default varaible for the profile dropdown picker
List<PickerModel> profileList = [
  PickerModel(
      title: 'Default',
      enabled: true,
      value: ProfileEnum.defaultprofile,
      icon: Icons.dashboard),
  PickerModel(
      title: 'Calculator',
      enabled: true,
      value: ProfileEnum.calculator,
      icon: Icons.calculate),
];

// default varaible for the audio visual dropdown picker
List<PickerModel> audioVisualList = [
  PickerModel(
      title: 'Power Bars', enabled: true, value: AudioVisualEnum.powerbar),
  PickerModel(
      title: 'Wave form', enabled: true, value: AudioVisualEnum.waveform)
];

// default varaible for the ambient screen dropdown picker
List<PickerModel> ambientScreenList = [
  PickerModel(
      title: 'Entire Screen', enabled: true, value: AmbientEnum.entirescreen),
  PickerModel(
      title: 'Foreground App', enabled: true, value: AmbientEnum.foregroundapp)
];

// default varaible for the interactive dropdown picker
List<PickerModel> interactiveList = [
  PickerModel(title: 'Key Wave', enabled: true, value: InteractiveEnum.keywave),
  PickerModel(title: 'Key Fade', enabled: true, value: InteractiveEnum.keyfade),
  PickerModel(
      title: 'Key Wave (Filled)',
      enabled: true,
      value: InteractiveEnum.keywavefilled),
  PickerModel(
      title: 'Key Wave (Rainbow)',
      enabled: true,
      value: InteractiveEnum.keywaverainbow),
];

// default varaible for the ambient display dropdown picker
List<PickerModel> ambientDisplayList = [
  PickerModel(
      // title: 'Display 1: X:0, Y:0, W:3840, H:2400',
      title: 'Display 1: X:0, Y:0, W:3840',
      enabled: true,
      value: AmbientDisplayEnum.display1),
];

// default varaible for the mode dropdown picker
List<PickerModel> moodList = [
  PickerModel(
    title: 'Tools',
    enabled: false,
  ),
  PickerModel(
      title: 'Shortcut Colors',
      enabled: true,
      value: EnumModes.shortcut,
      icon: Icons.shortcut),
  PickerModel(
      title: 'Mood', enabled: true, value: EnumModes.mood, icon: Icons.mood),
  PickerModel(
      title: 'Color Production',
      enabled: true,
      value: EnumModes.colorproduction,
      icon: Icons.production_quantity_limits),
  PickerModel(
    title: 'Effects',
    enabled: false,
  ),
  PickerModel(
      title: 'Wave', enabled: true, value: EnumModes.wave, icon: Icons.waves),
  PickerModel(
      title: 'Color Cycle',
      enabled: true,
      value: EnumModes.colorcycle,
      icon: Icons.color_lens),
  PickerModel(
      title: 'Breathing',
      enabled: true,
      value: EnumModes.breathing,
      icon: Icons.air_outlined),
  PickerModel(
      title: 'Blinking',
      enabled: true,
      value: EnumModes.blinking,
      icon: Ionicons.eye_off),
  PickerModel(
      title: 'Image', enabled: true, value: EnumModes.image, icon: Icons.image),
  PickerModel(
      title: 'Interactive',
      enabled: true,
      value: EnumModes.interactive,
      icon: Icons.merge_type_sharp),
  PickerModel(
      title: 'Audio Visualizer',
      enabled: true,
      value: EnumModes.audiovisualizer,
      icon: Ionicons.musical_note_outline),
  PickerModel(
      title: 'Ambient',
      enabled: true,
      value: EnumModes.ambient,
      icon: Icons.layers_outlined),
];

// Mode provider to manage the current colors or effects of a mode been selected
class ModeProvider extends ChangeNotifier {
  ToolsModeModel currentMode = ToolsModeModel(
      currentColor: [],
      effects: EffectsModel(),
      name: "Mood",
      value: EnumModes.mood,
      modeType: EnumModeType.layers,
      icon: Icons.mood);
  // EffectProvider effectProvider = EffectProvider();
  // ColorPickerProvider colorPickerProvider = ColorPickerProvider();

  /// function set the current mode information to the provider mode variable
  void setCurrentMode(ToolsModeModel data) {
    currentMode = data;
    notifyListeners();
  }

  //// function designed to get the current picker mode and return picker mode list
  List<PickerModel> getPickerModes(String mode) {
    switch (mode) {
      case "mood":
        return moodList;
      case "audiolist":
        return audioVisualList;
      case "profile":
        return profileList;
      case "interactivesub":
        return interactiveList;
      case "ambientdisplay":
        return ambientDisplayList;
      case "ambientscreen":
        return ambientScreenList;
      default:
        return [];
    }
  }

  /// function designed to change the tools and effects mode widget and return the chosen widget
  /// also sets the default colors and mode information
  Widget? changeModeComponent(PickerModel? pickerChoice, BuildContext context) {
    // default variable for settin currentcolors in this function
    List<Color> currentColors = [];
    // default variable for settin effects in this function
    EffectsModel effects = EffectsModel(effectName: pickerChoice?.value);
    // default variable for settin tools and effects widget in this function
    Widget? preset;

    /// initialize the workspace provider to use to send notification accross the workspace
    WorkspaceProvider workProvider =
        Provider.of<WorkspaceProvider>(context, listen: false);

    // switch case design to switch and set the values for each mode been selected based on the enum value set by the mode
    switch (pickerChoice!.value) {
      case EnumModes.shortcut:
        workProvider.toggleModal([Text("Hello World", style: h2Style)]);
        shortcutList.forEach((element) {
          currentColors.add(element.colorCode[0]);
        });
        preset = const ShortcutColorsPreset();
        break;
      case EnumModes.mood:
        currentColors = moodThemesList.first.colorCode;
        preset = const MoodPreset();
        break;
      case EnumModes.colorproduction:
        currentColors = colorProductionList.first.colorCode;
        preset = const ColorProductionPreset();
        break;
      case EnumModes.audiovisualizer:
        audioVisualSolidList.forEach((element) {
          currentColors.add(element.colorCode[0]);
        });
        preset = const AudioVisualPreset();
        break;
      case EnumModes.wave:
        currentColors = waveCustomList.first.colorCode;
        defaultWaveEffectValues.effectName = pickerChoice.value;
        effects = defaultWaveEffectValues;
        preset = const WavePreset();
        break;
      case EnumModes.colorcycle:
        colorcycleDefaultsList.first.colorCode.forEach((element) {
          currentColors.add(element);
        });
        preset = const ColorCyclePreset();
        break;
      case EnumModes.breathing:
        breathingList.forEach((element) {
          currentColors.add(element.colorCode[0]);
        });
        preset = const BreathingPreset();
        break;
      case EnumModes.blinking:
        defaultBlinkingEffectValues.effectName = pickerChoice.value;
        effects = defaultBlinkingEffectValues;
        blinkingList.forEach((element) {
          currentColors.add(element.colorCode[0]);
        });
        preset = const BlinkingPreset();
        break;
      case EnumModes.interactive:
        ////  set an notification message for interactive mode
        workProvider.toggleStripNotification(
            "Interactive effect will only work with your keyboard. Please assign the keys thatare used for triggering the effect. Hold down the Ctrl key for multiple selection");
        interactiveColorList.forEach((element) {
          currentColors.add(element.colorCode[0]);
        });
        preset = const InteractivePreset();
        break;
      case EnumModes.image:
        currentColors.add(Colors.transparent);
        preset = const ImagePreset();
        break;
      case EnumModes.ambient:
        currentColors.add(Colors.transparent);
        preset = const AmbeintPreset();
        break;
      default:
        currentColors.add(Colors.transparent);
        preset = Container();
        break;
    }

    //// set the current effects to the effects provider
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: effects.effectName,
        degree: effects.degree,
        speed: effects.speed));

    //// set the current mode to the mode been selected and change to and apply all current colors and effects
    setCurrentMode(ToolsModeModel(
        currentColor: currentColors,
        value: pickerChoice.value,
        icon: pickerChoice.icon,
        effects: effectsProvider.currentEffect!,
        name: pickerChoice.title));
    return preset;
  }

  // get current mode information
  getModeInformation() {
    return currentMode;
  }

  // change the mode type for the current mode between sublayer and layer based on the value passed
  setModeType(bool isSubLayer) {
    currentMode.modeType =
        (isSubLayer == true) ? EnumModeType.sublayer : EnumModeType.layers;
    notifyListeners();
  }
}
