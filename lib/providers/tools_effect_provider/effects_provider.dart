import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

// color production lists

class EffectProvider extends ChangeNotifier {
  EffectsModel currentEffect = EffectsModel();
  EffectsModel defaultWaveEffectValues =
      EffectsModel(speed: 40.00, degree: 0.00);
  EffectsModel defaultBlinkingEffectValues = EffectsModel(speed: 40.00);
  EffectsModel colorcycleEffectList = EffectsModel(speed: 45.00);

  void setCurrentEffect(EffectsModel data) {
    currentEffect = data;
    notifyListeners();
  }
}
