import 'package:hpx/models/tools_effect/effects_model.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/mode_provider.dart';

class EffectProvider {
  EffectsModel? currentEffect;
  final _modeProvider = ModeProvider();

  void setCurrentEffect(EffectsModel data) {
    currentEffect = data;
    _modeProvider.currentMode?.effects = [currentEffect];
  }

  void setEffectSliderValue(double returnValue, String type) {}

  void saveModeInformation() {}
  void getModeInformation() {}
}
