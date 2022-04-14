import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class colorsPreset extends StatefulWidget {
  @override
  State<colorsPreset> createState() => _colorsPresetState();
}

class _colorsPresetState extends State<colorsPreset> {
  String activatedButton = "Themes";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Presets", textAlign: TextAlign.left, style: h4Style),
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
                            textColor: (this.activatedButton == 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton == 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: Text('THEMES'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "Themes";
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
                            textColor: (this.activatedButton != 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activatedButton != 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                this.activatedButton = "Custom";
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: (this.activatedButton == 'Themes')
                      ? [
                          Color_Picker(
                              title: 'Night Mode', color: Colors.orangeAccent),
                          Color_Picker(title: 'Focus', color: Colors.lightBlue),
                          Color_Picker(
                              title: 'Relax', color: Colors.greenAccent),
                          Color_Picker(
                              title: 'Create', color: Colors.deepOrange),
                          Color_Picker(title: 'Ideate', color: Colors.purple),
                        ]
                      : [
                          Color_Picker(
                              title: 'Custom 1', color: Colors.transparent),
                          Color_Picker(
                              title: 'Custom 2', color: Colors.transparent),
                          Color_Picker(
                              title: 'Custom 3', color: Colors.transparent),
                          Color_Picker(
                              title: 'Custom 4', color: Colors.transparent),
                          Color_Picker(
                              title: 'Custom 5', color: Colors.transparent),
                        ]),
            ),
          ],
        ));
  }
}
