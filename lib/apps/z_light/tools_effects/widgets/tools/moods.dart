import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class MoodPreset extends StatefulWidget {
  @override
  State<MoodPreset> createState() => _MoodPresetState();
}

class _MoodPresetState extends State<MoodPreset> {
  String activatedButton = "Themes";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Presets", textAlign: TextAlign.left, style: h4Style),
            Container(
              margin: EdgeInsets.only(top: 10.0),
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
                            child: Text('Themes'),
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
                            child: Text('Custom'),
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
                              leftTitle: '',
                              title: 'Night Mode',
                              color: Colors.orangeAccent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Focus',
                              color: Colors.lightBlue),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Relax',
                              color: Colors.greenAccent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Create',
                              color: Colors.deepOrange),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Ideate',
                              color: Colors.purple),
                        ]
                      : [
                          Color_Picker(
                              leftTitle: '',
                              title: 'Custom 1',
                              color: Colors.transparent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Custom 2',
                              color: Colors.transparent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Custom 3',
                              color: Colors.transparent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Custom 4',
                              color: Colors.transparent),
                          Color_Picker(
                              leftTitle: '',
                              title: 'Custom 5',
                              color: Colors.transparent),
                        ]),
            ),
          ],
        ));
  }
}
