import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class WavePreset extends StatefulWidget {
  @override
  State<WavePreset> createState() => _WavePresetState();
}

class _WavePresetState extends State<WavePreset> {
  String activatedButton = "DEFAULT";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
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
                            textColor: (this.activatedButton == 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton == 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: Text('DEFAULT'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "DEFAULT";
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
                            textColor: (this.activatedButton != 'CUSTOM')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton != 'CUSTOM')
                                ? Colors.black
                                : Colors.white,
                            child: Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "CUSTOM";
                              });
                            },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              height: 450,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: (this.activatedButton == 'DEFAULT')
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
                          const Color_Picker(
                              title: '',
                              leftTitle: 'Left',
                              color: Colors.transparent)
                        ]),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                  ],
                )),
            Text("Speed", textAlign: TextAlign.left, style: h4Style),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child:
                  Text("Direction", textAlign: TextAlign.left, style: h4Style),
            ),
          ],
        ));
  }
}
