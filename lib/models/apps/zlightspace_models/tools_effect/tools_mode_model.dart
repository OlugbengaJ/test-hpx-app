import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

//// class interface model for Tools mode
class ToolsModeModel {
  //// Tools mode model initialization model
  ToolsModeModel(
      {

      /// currentColor is required while using toolsmode model
      required this.currentColor,

      /// effects is required while using toolsmode model
      required this.effects,

      /// mode name is required while using toolsmode model
      required this.name,

      /// mode type is set to Enum.layer for default while using toolsmode model
      this.modeType = EnumModeType.layers,

      /// icon is not required while using toolsmode model
      this.icon,

      /// submode is not required while using toolsmode model
      this.subMode,

      /// display is not required while using toolsmode model
      this.display,

      /// mode value is not required while using toolsmode model but highly advised to be set
      this.value});

  /// variable property hold the name of the tools and effects mode
  final String name;

  /// mode type enum is either layer or sublayers
  EnumModeType? modeType;

  /// submode set the mode as a sub mode or not
  dynamic subMode;

  /// display set the display for the current mode
  dynamic display;

  /// icon variable to set the icon data for that tools and effects mode
  IconData? icon;

  /// value is either and enum or string used to specify which toole and effects mode the user is current on
  final dynamic value;

  /// current color holds a list of colors been current in used by the color picker
  late final List<dynamic> currentColor;

  /// effects holds the current effect been used by the effects provider and tools and effects mode
  late final EffectsModel effects;
}

//// enum value for mode  picker
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

//// enum value for audio visual  picker
enum AudioVisualEnum { powerbar, waveform }

//// enum value for interactive  picker
enum InteractiveEnum { keywave, keyfade, keywavefilled, keywaverainbow }

//// enum value for ambient  picker
enum AmbientEnum { entirescreen, foregroundapp }

//// enum value for ambient display picker
enum AmbientDisplayEnum { display1 }

//// enum value for mode type picker
enum EnumModeType { layers, sublayer }

//// enum value for profile picker
enum ProfileEnum { defaultprofile, calculator }
