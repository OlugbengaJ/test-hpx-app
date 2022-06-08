import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/rotate_button.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:provider/provider.dart';

class WavePreset extends StatefulWidget {
  const WavePreset({Key? key}) : super(key: key);

  @override
  State<WavePreset> createState() => _WavePresetState();
}

class _WavePresetState extends State<WavePreset> {
  /// variable used to hold the button values for the activated or focused wave sub modoe
  String activatedButton = "DEFAULT";

  /// variable for managing degree input been set to the for the knob and input field
  TextEditingController degreeController = TextEditingController();

  late KnobController? _controller;

  void valueChangedListener(double value) {
    if (mounted) {
      _setDegreeValue(value);
    }
  }

  //// this function sets the default effect degree value to the degree knob
  @override
  void initState() {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);

    /// sets the state for the degree text controller
    setState(() {
      degreeController.text =
          effectsProvider.currentEffect!.degree!.toStringAsFixed(0);
    });
    _controller = KnobController(
      initial: double.parse(degreeController.text),
      maximum: 360,
      startAngle: 0,
      endAngle: 360,
    );
    _controller?.addOnValueChangedListener(valueChangedListener);
    super.initState();
  }

  /// this functions updates the degree values and sets the current effect state
  void _setDegreeValue(double? returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    // /// initialize the layers provider to use to send notification accross the layers
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);

    setState(() {
      degreeController.text = returnValue!.toStringAsFixed(0);
    });

    effectsProvider.setCurrentEffect(EffectsModel(
        effectName: modeProvider.currentMode.effects.effectName,
        degree: returnValue,
        speed: effectsProvider.currentEffect?.speed));
    layerProvider.toolsEffectsUpdated();
  }

  void _setSliderValue(double returnValue) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    // /// initialize the layers provider to use to send notification accross the layers
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    setState(() {
      effectsProvider.setCurrentEffect(EffectsModel(
          effectName: effectsProvider.currentEffect?.effectName,
          degree: effectsProvider.currentEffect?.degree,
          speed: returnValue.floorToDouble()));
      layerProvider.toolsEffectsUpdated();
    });
  }

  @override
  Widget build(BuildContext context) {
    EffectProvider effectsProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ColorPickerProvider colorpickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Color Presets", textAlign: TextAlign.left, style: labelStyle),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton == 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton == 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('DEFAULT'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "DEFAULT";
                              });
                            },
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (activatedButton != 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (activatedButton != 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: const Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                activatedButton = "CUSTOM";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Wrap(
                          children:
                              colorpickerProvider.generateColorPickerWidget(
                                  activatedButton == 'DEFAULT'
                                      ? waveDefaultsList
                                      : waveCustomList))
                    ])),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Divider(
              color: Colors.grey.shade800,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 20.0)),
            Text("Speed", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: effectsProvider.currentEffect!.speed!.toDouble(),
              max: 100,
              min: 0,
              divisions: 100,
              label: effectsProvider.currentEffect!.speed.toString(),
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
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(top: 30.0)),
            Text("Direction", textAlign: TextAlign.left, style: h4Style),
            Container(margin: const EdgeInsets.only(top: 10.0)),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Transform.rotate(
                        angle: 3.2,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              top: 10, left: 0, right: 0, bottom: 0),
                          child: Knob(
                            controller: _controller,
                            width: 70,
                            height: 70,
                            // style: KnobStyle(showLabels: false),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text("Degrees (o)",
                              textAlign: TextAlign.left, style: labelStyle),
                          Container(margin: const EdgeInsets.only(top: 10.0)),
                          SizedBox(
                              width: 70,
                              height: 30,
                              child: TextField(
                                onSubmitted: (String? value) {
                                  if (double.parse(value!) > 360) {
                                    value =
                                        (double.parse(value) % 360).toString();
                                  }
                                  _controller
                                      ?.setCurrentValue(double.parse(value));
                                  _setDegreeValue(double.parse(value));
                                },
                                style: const TextStyle(fontSize: 14),
                                controller: degreeController,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 5),
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ))
                        ],
                      )),
                  const VerticalDivider(
                    width: 60,
                    thickness: 0,
                    indent: 20,
                    endIndent: 0,
                  ),
                ])
          ],
        ));
  }
}
