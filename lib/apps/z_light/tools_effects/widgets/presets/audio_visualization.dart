import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class AudioVisualPreset extends StatefulWidget {
  @override
  State<AudioVisualPreset> createState() => _AudioVisualPresetState();
}

class _AudioVisualPresetState extends State<AudioVisualPreset> {
  String activatedButton = "Solid";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Color Presets", textAlign: TextAlign.left, style: h4Style),
            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlatButton(
                            textColor: (this.activatedButton == 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton == 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: Text('Solid'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "Solid";
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
                            textColor: (this.activatedButton != 'Gradient')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton != 'Gradient')
                                ? Colors.black
                                : Colors.white,
                            child: Text('Gradient'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "Gradient";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
