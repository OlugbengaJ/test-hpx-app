import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';

class Color_Preset extends StatefulWidget {
  @override
  State<Color_Preset> createState() => _Color_PresetState();
}

class _Color_PresetState extends State<Color_Preset> {
  String activated_btn = "Themes";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Presets",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white70)),
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
                            textColor: (this.activated_btn == 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activated_btn == 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: Text('THEMES'),
                            onPressed: () {
                              setState(() {
                                this.activated_btn = "Themes";
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
                            textColor: (this.activated_btn != 'Custom')
                                ? Colors.grey
                                : Colors.black,
                            height: 40.0,
                            color: (this.activated_btn != 'Custom')
                                ? Colors.black
                                : Colors.white,
                            child: Text('CUSTOM'),
                            onPressed: () {
                              setState(() {
                                this.activated_btn = "Custom";
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
                  children: (this.activated_btn == 'Themes')
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
