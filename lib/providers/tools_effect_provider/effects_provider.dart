import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

EffectsModel defaultWaveEffectValues = EffectsModel(speed: 40.00, degree: 0.00);
EffectsModel defaultBlinkingEffectValues = EffectsModel(speed: 40.00);
EffectsModel defaultBreathingEffectValues = EffectsModel(speed: 50.00);
EffectsModel defaultInteractiveEffectValues =
    EffectsModel(speed: 50.00, size: 6.0);
EffectsModel defaultColorcycleEffectValues = EffectsModel(speed: 45.00);

//// effect provider class to handle the various effects and set the current effect animanation
class EffectProvider extends ChangeNotifier {
  EffectsModel? currentEffect;

  /// function to set current effect
  void setCurrentEffect(EffectsModel data) {
    currentEffect = data;
    notifyListeners();
  }
}
