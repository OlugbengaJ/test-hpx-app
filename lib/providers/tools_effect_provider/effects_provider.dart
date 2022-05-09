import 'package:flutter/material.dart';
import 'package:hpx/models/tools_effect/effects_model.dart';

class EffectProvider extends ChangeNotifier {
  EffectsModel? currentEffect;

  void setCurrentEffect(EffectsModel data) {
    currentEffect = data;
    notifyListeners();
  }

  void setEffectSliderValue(double returnValue, String type) {}

  void waveEffect(
    double speed,
    double direction,
  ) {}

  void colorCycleEffect(double speed) {}

  void breathingEffect(double speed) {}

  void blinkingEffect(double speed) {}

  void interactiveEffect(double speed, double size) {}

  void audioVisualizerEffect() {}

  void ambientEffect(double imageQuality, double perSecondUpdates) {}

  processEfect(String effect) {
    switch (effect) {
      case "audiovisualizer":
        audioVisualizerEffect();
        break;
      case "wave":
        break;
      case "colorcycle":
        break;
      case "breathing":
        break;
      case "blinking":
        break;
      case "interactive":
        break;
      case "image":
        break;
      case "ambient":
        break;
      default:
        break;
    }
  }
}
