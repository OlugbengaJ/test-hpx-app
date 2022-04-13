import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';

class Color_Preset extends StatefulWidget {
  @override
  State<Color_Preset> createState() => _Color_PresetState();
}

class _Color_PresetState extends State<Color_Preset> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Presets", textAlign: TextAlign.left),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Color_Picker(
                        title: 'Night Mode', color: Colors.orangeAccent),
                    Color_Picker(title: 'Focus', color: Colors.lightBlue),
                    Color_Picker(title: 'Relax', color: Colors.greenAccent),
                    Color_Picker(title: 'Create', color: Colors.deepOrange),
                    Color_Picker(title: 'Ideate', color: Colors.purple),
                  ]),
            ),
          ],
        ));
  }
}
