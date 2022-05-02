import 'package:hpx/models/tools_effect/color_picker_model.dart';

class ToolsModeModel {
  ToolsModeModel(
      {required this.currentColor,
      required this.effects,
      required this.name,
      this.value});

  final String name;
  final String? value;
  late final List<ColorPickerWidgetModel> currentColor;
  late final List<dynamic> effects;
}
