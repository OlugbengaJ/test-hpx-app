import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/ambient.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/audio_visualization.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/blinking.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/breathing.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/color_cycle.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/image.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/interactive.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/effects/wave.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/preconfigured/contactsupport.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/color_production.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/moods.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/tools/shortcut_colors.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/contact_support_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/image_mode_provder.dart';
import 'package:hpx/providers/tools_effect_provider/widget/shortcut_widget_provider.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  PickerModel(
    title: 'Preconfigured Tools',
    enabled: false,
  ),
  PickerModel(
      title: 'Contact Support',
      enabled: true,
      value: EnumModes.contactsupport,
      icon: Icons.contact_support),
  PickerModel(
      title: 'Application Hotkeys',
      enabled: true,
      value: EnumModes.hotkeys,
      icon: Icons.keyboard_sharp),
];

// Mode provider to manage the current colors or effects of a mode been selected
class ModeProvider extends ChangeNotifier {
  ToolsModeModel currentMode = ToolsModeModel(
      currentColor: moodThemesList.first.colorCode,
      effects: EffectsModel(effectName: EnumModes.mood),
      name: "Mood",
      value: EnumModes.mood,
      modeType: EnumModeType.layers,
      icon: Icons.mood);

  bool isLost = false;

  // default variable for settin tools and effects widget in this function
  Widget preset = Container();

  // default variable for settin tools and effects widget in this function
  PickerModel modePicker =
      PickerModel(title: 'Mood', value: EnumModes.mood, enabled: true);

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
  changeModeComponent(
      PickerModel? pickerChoice, BuildContext context, bool isChange,
      {bool changeComp: false}) async {
    // default variable for settin currentcolors in this function
    List<Color> currentColors = [];
    // default variable for settin effects in this function
    EffectsModel effects = EffectsModel(effectName: pickerChoice?.value);

    /// initialize the workspace provider to use to send notification accross the workspace
    WorkspaceProvider workProvider =
        Provider.of<WorkspaceProvider>(context, listen: false);
    ImageModeProvider imageModeProvider =
        Provider.of<ImageModeProvider>(context, listen: false);
    //// set the current effects to the effects provider
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    ShortcutWidgetProvider shortcutWidgetProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);

    /// if last mode was interactive
    if (currentMode.value == EnumModes.interactive) {
      ////  set an notification message for interactive mode
      workProvider.toggleStripNotification(
          "Your interactive setting are going to be lost");
    }

    // switch case design to switch and set the values for each mode been selected based on the enum value set by the mode
    switch (pickerChoice!.value) {
      case EnumModes.shortcut:
        for (var element in shortcutList) {
          currentColors.add(element.colorCode[0]);
        }
        effects.effectName = pickerChoice.value;
        preset = const ShortcutColorsPreset();
        break;
      case EnumModes.mood:
        currentColors = moodThemesList.first.colorCode;
        effects.effectName = pickerChoice.value;
        preset = const MoodPreset();
        break;
      case EnumModes.colorproduction:
        currentColors = colorProductionList.first.colorCode;
        effects.effectName = pickerChoice.value;
        preset = const ColorProductionPreset();
        break;
      case EnumModes.audiovisualizer:
        for (var element in audioVisualSolidList) {
          currentColors.add(element.colorCode[0]);
        }
        effects.effectName = pickerChoice.value;
        preset = const AudioVisualPreset();
        break;
      case EnumModes.wave:
        currentColors = waveCustomList.first.colorCode;
        defaultWaveEffectValues.effectName = pickerChoice.value;
        effects = defaultWaveEffectValues;
        preset = const WavePreset();
        break;
      case EnumModes.colorcycle:
        for (var element in colorcycleDefaultsList.first.colorCode) {
          currentColors.add(element);
        }
        defaultColorcycleEffectValues.effectName = pickerChoice.value;
        effects = defaultColorcycleEffectValues;
        preset = const ColorCyclePreset();
        break;
      case EnumModes.breathing:
        for (var element in breathingList) {
          currentColors.add(element.colorCode[0]);
        }
        defaultBreathingEffectValues.effectName = pickerChoice.value;
        effects = defaultBreathingEffectValues;
        preset = const BreathingPreset();
        break;
      case EnumModes.blinking:
        defaultBlinkingEffectValues.effectName = pickerChoice.value;
        effects = defaultBlinkingEffectValues;
        for (var element in blinkingList) {
          currentColors.add(element.colorCode[0]);
        }
        preset = const BlinkingPreset();
        break;
      case EnumModes.interactive:
        ////  set an notification message for interactive mode
        workProvider.toggleStripNotification(
            "Interactive effect will only work with your keyboard. Please assign the keys thatare used for triggering the effect. Hold down the Ctrl key for multiple selection");
        for (var element in interactiveColorList) {
          currentColors.add(element.colorCode[0]);
        }
        effects = defaultInteractiveEffectValues;
        preset = const InteractivePreset();
        break;
      case EnumModes.image:

        /// convert the default image into color paltte
        ByteData image = await rootBundle.load(Constants.defaultImageMode);
        currentColors.add(Colors.transparent);

        if (currentMode.effects.imageBytes == null || isChange == false) {
          imageModeProvider.setImageBytes(image.buffer.asUint8List());
          effects.imageBytes = image.buffer.asUint8List();
        }
        if (currentMode.effects.imageBytes != null) {
          effects.extractedColors = currentMode.effects.extractedColors;
          imageModeProvider.setImageBytes(currentMode.effects.imageBytes!);
        }
        effects.extractedColors = imageModeProvider.getExtractColors();

        effects.effectName = pickerChoice.value;
        preset = ImagePreset();
        break;
      case EnumModes.ambient:
        currentColors.add(Colors.transparent);
        effects.effectName = pickerChoice.value;
        effects.imageQuality = 50.0;
        effects.updatePerSecond = 40.0;
        preset = const AmbeintPreset();
        break;
      case EnumModes.contactsupport:
        for (var element in contactsupportlist) {
          currentColors.add(element.colorCode[0]);
        }
        preset = const ContactSupportPreset();
        break;
      default:
        currentColors.add(Colors.transparent);
        preset = Container();
        break;
    }

    modePicker = pickerChoice;
    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: (isChange == true)
            ? currentMode.effects.effectName
            : effects.effectName,
        degree:
            (isChange == true) ? currentMode.effects.degree : effects.degree,
        imageQuality: (isChange == true)
            ? currentMode.effects.imageQuality
            : effects.imageQuality,
        updatePerSecond: (isChange == true)
            ? currentMode.effects.updatePerSecond
            : effects.updatePerSecond,
        size: (isChange == true) ? currentMode.effects.size : effects.size,
        extractedColors: (isChange == true)
            ? currentMode.effects.extractedColors
            : effects.extractedColors,
        speed: (isChange == true) ? currentMode.effects.speed : effects.speed,
        imageBytes: (isChange == true)
            ? currentMode.effects.imageBytes
            : effects.imageBytes));

    //// set the current mode to the mode been selected and change to and apply all current colors and effects
    setCurrentMode(ToolsModeModel(
        currentColor:
            (isChange == true) ? currentMode.currentColor : currentColors,
        value: (isChange == true) ? currentMode.value : pickerChoice.value,
        icon: (isChange == true) ? currentMode.icon : pickerChoice.icon,
        shortcutKeys: (isChange == true)
            ? currentMode.shortcutKeys
            : shortcutWidgetProvider.keys,
        modeType:
            (isChange == true) ? currentMode.modeType : currentMode.modeType,
        effects: (isChange == true)
            ? currentMode.effects
            : effectsProvider.currentEffect!,
        name: (isChange == true)
            ? currentMode.name
            : (currentMode.value == pickerChoice.value)
                ? currentMode.name
                : pickerChoice.title));
    layerProvider.toolsEffectsUpdated(modeChanged: changeComp);
  }

  // get current mode information
  getModeInformation() {
    return currentMode;
  }

  setShortcutKeys(context, List<List<String>> keys) {
    ShortcutWidgetProvider shortcutWidgetProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    for (var element in shortcutWidgetProvider.keys) {
      shortcutWidgetProvider.addNewCommand(element.first, element.last);
    }
    currentMode.shortcutKeys = keys;
    setCurrentMode(currentMode);

    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    layerProvider.toolsEffectsUpdated();
  }

  // change the mode type for the current mode between sublayer and layer based on the value passed
  setModeType(bool isSubLayer) {
    currentMode.modeType =
        (isSubLayer) ? EnumModeType.sublayer : EnumModeType.layers;
    // print(currentMode.modeType);
    notifyListeners();
  }

  void activateContactSupportDialog() {
    this.isLost = true;
    notifyListeners();
  }
}
