import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

class ToolsModeModel {
  ToolsModeModel(
      {required this.currentColor,
      required this.effects,
      required this.name,
      this.modeType = EnumModeType.layers,
      this.icon,
      this.subMode = false,
      this.value});

  final String name;
  EnumModeType? modeType;
  bool? subMode;
  IconData? icon;
  final dynamic? value;
  late final List<dynamic> currentColor;
  late final EffectsModel effects;
}

enum EnumModes {
  mood,
  shortcut,
  colorproduction,
  audiovisualizer,
  wave,
  colorcycle,
  breathing,
  blinking,
  interactive,
  image,
  ambient,
}

enum AudioVisualEnum { powerbar, waveform }
enum InteractiveEnum { keywave, keyfade, keywavefilled, keywaverainbow }
enum AmbientEnum { entirescreen, foregroundapp }
enum AmbientDisplayEnum { display1 }
enum EnumModeType { layers, sublayer }

enum ProfileEnum { defaultprofile, calculator }
