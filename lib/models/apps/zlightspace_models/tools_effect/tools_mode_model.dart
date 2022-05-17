import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

class ToolsModeModel {
  ToolsModeModel(
      {required this.currentColor,
      required this.effects,
      required this.name,
      this.modeType = "layer",
      this.subMode = false,
      this.value});

  final String name;
  String? modeType;
  bool? subMode;
  final String? value;
  late final List<dynamic> currentColor;
  late final EffectsModel effects;
}
