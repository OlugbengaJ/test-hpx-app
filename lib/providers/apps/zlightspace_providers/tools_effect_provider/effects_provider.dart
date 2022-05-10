import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/utils/KeyboardController.dart';

class EffectProvider extends ChangeNotifier {
  List<EffectsModel>? currentEffect;

  void setCurrentEffect(List<dynamic> data) {
    currentEffect = data.cast<EffectsModel>();

    notifyListeners();
  }

  void setEffectSliderValue(double returnValue, String type) {}

  void waveEffect(
    double speed,
    double direction,
  ) {}

  void colorCycleEffect(double speed) {}

  void breathingEffect(double? speed, effect, List<dynamic> colors) {
    try {
      KeyboardController.breathingEffect(
          colors: colors.cast<Color>(), speed: 1);
    } catch (exception) {
      print(exception);
    }
  }

  void blinkingEffect(double? speed, effect, List<dynamic> colors) {
    try {
      KeyboardController.blinkEffect(colors: colors.cast<Color>(), speed: 1);
    } catch (exception) {
      print(exception);
    }
  }

  void interactiveEffect(double speed, double size) {}

  void audioVisualizerEffect() {}

  void ambientEffect(double imageQuality, double perSecondUpdates) {}
}
