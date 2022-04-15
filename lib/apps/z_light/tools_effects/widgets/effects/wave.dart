import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class WavePreset extends StatefulWidget {
  @override
  State<WavePreset> createState() => _WavePresetState();
}

class _WavePresetState extends State<WavePreset> {
  String activatedButton = "DEFAULT";
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Color Presets", textAlign: TextAlign.left, style: h4Style),
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
                            child: Text('DEFAULT'),
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
                            child: Text('CUSTOM'),
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
                  children: (activatedButton == 'DEFAULT')
                      ? [
                          Color_Picker(
                              leftTitle: '',
                              title: 'Galaxy',
                              color: Colors.orangeAccent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Ocean',
                              color: Colors.lightBlue),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Jungle',
                              color: Colors.greenAccent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Volcano',
                              color: Colors.deepOrange),
                          Color_Picker(
                              leftTitle: '',
                              title: 'OMEN',
                              color: Colors.purple),
                        ]
                      : [
                          Color_Picker(
                              title: '',
                              leftTitle: 'Edit',
                              color: Colors.transparent)
                        ]),
            ),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Text("Speed", textAlign: TextAlign.left, style: labelStyle),
            Container(margin: const EdgeInsets.only(bottom: 10.0)),
            Slider(
              value: _currentSliderValue,
              max: 100,
              min: 0,
              divisions: 1,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
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
            Container(margin: const EdgeInsets.only(top: 20.0)),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child:
                  Text("Direction", textAlign: TextAlign.left, style: h4Style),
            ),
          ],
        ));
  }
}
