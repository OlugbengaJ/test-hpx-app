class ToolsModeModel {
  ToolsModeModel(
      {required this.currentColor,
      required this.effects,
      required this.name,
      this.value});

  final String name;
  final String? value;
  late final List<dynamic> currentColor;
  late final List<dynamic> effects;
}