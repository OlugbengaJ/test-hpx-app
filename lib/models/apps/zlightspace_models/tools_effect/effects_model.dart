class EffectsModel {
  EffectsModel(
      {this.degree = 0.0,
      this.size = 0.0,
      this.speed,
      this.updatePerSecond = 0.0,
      this.imageQuality = 0.0,
      this.effectType,
      this.effectName = "mood"});

  double? degree;
  double? speed;
  double? size;
  double? updatePerSecond;
  double? imageQuality;
  String? effectType;
  dynamic? effectName;
}

// class SpeedModel {
//   SpeedModel({required this.speedDistance, required this.speedTime});

//   final double speedDistance;
//   final double speedTime;
// }
