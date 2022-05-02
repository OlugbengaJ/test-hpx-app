class EffectsModel {
  EffectsModel(
      {this.degree = 0.0,
      this.size = 0.0,
      this.speed = 0.0,
      this.updatePerSecond = 0.0,
      this.imageQuality = 0.0,
      required this.effectType,
      required this.effectName});

  double? degree;
  double? speed;
  double? size;
  double? updatePerSecond;
  double? imageQuality;
  final String effectType;
  final String effectName;
}
