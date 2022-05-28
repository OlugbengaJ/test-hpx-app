import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/widgets/theme.dart';

class ColorCyclePreset extends StatefulWidget {
  const ColorCyclePreset({Key? key}) : super(key: key);

  @override
  State<ColorCyclePreset> createState() => _ColorCycleState();
}

class _ColorCycleState extends State<ColorCyclePreset> {
  String activatedButton = "DEFAULT";
  double _currentSliderValue = 0.0;
  TextEditingController degreeController = TextEditingController();
  final _colorPickerProvider = ColorPickerProvider();

  void _setSliderValue(double returnValue) {
    setState(() {
      _currentSliderValue = returnValue;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                              _colorPickerProvider.generateColorPickerWidget(
                                  activatedButton == 'DEFAULT'
                                      ? colorcycleDefaultsList
                                      : colorcycleCustomList))
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
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("100%", textAlign: TextAlign.right, style: pStyle),
                ],
              ))
            ]),
          ],
        ));
  }
}
