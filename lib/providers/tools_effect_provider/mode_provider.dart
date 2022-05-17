import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:ionicons/ionicons.dart';

// default varaible for the profile dropdown picker
List<PickerModel> profileList = [
  PickerModel(
      title: 'Default', enabled: true, value: 'default', icon: Icons.dashboard),
  PickerModel(
      title: 'Calculator',
      enabled: true,
      value: 'shortcut',
      icon: Icons.calculate),
];

// default varaible for the audio visual dropdown picker
List<PickerModel> audioVisualList = [
  PickerModel(title: 'Power Bars', enabled: true, value: 'powerbar'),
  PickerModel(title: 'Wave form', enabled: true, value: 'waveform')
];

// default varaible for the ambient screen dropdown picker
List<PickerModel> ambientScreenList = [
  PickerModel(title: 'Entire Screen', enabled: true, value: 'entire_screen'),
  PickerModel(title: 'Foreground App', enabled: true, value: 'foreground_app'),
];

// default varaible for the interactive dropdown picker
List<PickerModel> interactiveList = [
  PickerModel(title: 'Key Wave', enabled: true, value: 'key_wave'),
  PickerModel(title: 'Key Fade', enabled: true, value: 'key_fade'),
  PickerModel(
      title: 'Key Wave (Filled)', enabled: true, value: 'key_wave_filled'),
  PickerModel(
      title: 'Key Wave (Rainbow)', enabled: true, value: 'key_wave_rainbow'),
];

// default varaible for the ambient display dropdown picker
List<PickerModel> ambientDisplayList = [
  PickerModel(
      // title: 'Display 1: X:0, Y:0, W:3840, H:2400',
      title: 'Display 1: X:0, Y:0, W:3840',
      enabled: true,
      value: 'display_1'),
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
      value: 'shortcut',
      icon: Icons.shortcut),
  PickerModel(title: 'Mood', enabled: true, value: 'mood', icon: Icons.mood),
  PickerModel(
      title: 'Color Production',
      enabled: true,
      value: 'colorsproduction',
      icon: Icons.production_quantity_limits),
  PickerModel(
    title: 'Effects',
    enabled: false,
  ),
  PickerModel(title: 'Wave', enabled: true, value: 'wave', icon: Icons.waves),
  PickerModel(
      title: 'Color Cycle',
      enabled: true,
      value: 'colorcycle',
      icon: Icons.color_lens),
  PickerModel(
      title: 'Breathing',
      enabled: true,
      value: 'breathing',
      icon: Icons.air_outlined),
  PickerModel(
      title: 'Blinking',
      enabled: true,
      value: 'blinking',
      icon: Ionicons.eye_off),
  PickerModel(title: 'Image', enabled: true, value: 'image', icon: Icons.image),
  PickerModel(
      title: 'Interactive',
      enabled: true,
      value: 'interactive',
      icon: Icons.merge_type_sharp),
  PickerModel(
      title: 'Audio Visualizer',
      enabled: true,
      value: 'audiovisualizer',
      icon: Ionicons.musical_note_outline),
  PickerModel(
      title: 'Ambient',
      enabled: true,
      value: 'ambient',
      icon: Icons.layers_outlined),
];

// Mode provider to manage the current colors or effects of a mode been selected
class ModeProvider extends ChangeNotifier {
  ToolsModeModel currentMode =
      ToolsModeModel(currentColor: [], effects: EffectsModel(), name: "");
  EffectProvider effectProvider = EffectProvider();
  ColorPickerProvider colorPickerProvider = ColorPickerProvider();

  void setCurrentMode(ToolsModeModel data) {
    currentMode = data;
    notifyListeners();
  }

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

  // get current mode information
  getModeInformation() {
    return currentMode;
  }
}
