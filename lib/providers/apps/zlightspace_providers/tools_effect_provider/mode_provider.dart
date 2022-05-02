import 'package:flutter/material.dart';
import 'package:hpx/models/tools_effect/tools_mode_model.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:ionicons/ionicons.dart';

List<PickerModel> profileList = [
  PickerModel(
      title: 'Default', enabled: true, value: 'default', icon: Icons.dashboard),
  PickerModel(
      title: 'Calculator',
      enabled: true,
      value: 'shortcut',
      icon: Icons.calculate),
];

List<PickerModel> audioVisualList = [
  PickerModel(title: 'Power Bars', enabled: true, value: 'powerbar'),
  PickerModel(title: 'Wave form', enabled: true, value: 'waveform')
];

List<PickerModel> ambientScreenList = [
  PickerModel(title: 'Entire Screen', enabled: true, value: 'entire_screen'),
  PickerModel(title: 'Foreground App', enabled: true, value: 'foreground_app'),
];

List<PickerModel> interactiveList = [
  PickerModel(title: 'Key Wave', enabled: true, value: 'key_wave'),
];

List<PickerModel> ambientDisplayList = [
  PickerModel(
      // title: 'Display 1: X:0, Y:0, W:3840, H:2400',
      title: 'Display 1: X:0, Y:0, W:3840',
      enabled: true,
      value: 'display_1'),
];

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
      title: 'Colors Production',
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

class ModeProvider {
  ToolsModeModel? currentMode;

  void setCurrentMode(ToolsModeModel data) {
    currentMode = data;
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

  void saveModeInformation() {}
  void getModeInformation() {}
}
