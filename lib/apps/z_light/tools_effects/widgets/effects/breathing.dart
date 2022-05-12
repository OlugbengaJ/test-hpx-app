import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class BreathingPreset extends StatefulWidget {
  const BreathingPreset({Key? key}) : super(key: key);

  @override
  State<BreathingPreset> createState() => _BreathingPresetState();
}

class _BreathingPresetState extends State<BreathingPreset> {
  final _toolsProvider = ColorPickerProvider();
  double _currentSliderValue = 0.0;
  final double _currentAngleValue = 0.0;
  TextEditingController degreeController = TextEditingController();
  final _colorPickerProvider = ColorPickerProvider();

  @override
  void initState() {
    setDefaultColors(context);
    // TODO: implement initState
    super.initState();
  }

  Future setDefaultColors(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    List<Color> currentColors = [];
    breathingList.forEach((element) {
      currentColors.add(element.colorCode[0]);
    });
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: currentColors,
        value: modeProvider.currentMode.value,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));
  }

  void _setSliderValue(double returnValue) {
    setState(() {
      _currentSliderValue = returnValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            children: _toolsProvider.generateColorPickerWidget(breathingList),
          ),
          Container(margin: const EdgeInsets.only(bottom: 10.0)),
          Divider(
            color: Colors.grey.shade800,
            height: 1,
          ),
          Container(margin: const EdgeInsets.only(bottom: 20.0)),
          Text("Speed", textAlign: TextAlign.left, style: labelStyle),
          Container(margin: const EdgeInsets.only(bottom: 10.0)),
          Slider(
            value: _currentSliderValue,
            max: 100,
            min: 0,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              _setSliderValue(value);
            },
          ),
          Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("0%", textAlign: TextAlign.left, style: pStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
