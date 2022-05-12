import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

class ToolsModeModel {
  ToolsModeModel(
      {required this.currentColor,
      required this.effects,
      required this.name,
      this.value});

  final String name;
  final String? value;
  late final List<dynamic> currentColor;
  late final EffectsModel effects;
}
