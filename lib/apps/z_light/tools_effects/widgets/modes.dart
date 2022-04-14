import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hpx/widgets/components/color_picker.dart';

class toolModes extends StatefulWidget {
  @override
  State<toolModes> createState() => _toolModesState();
}

class _toolModesState extends State<toolModes> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Tools & Effects",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white70)),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Color_Picker(
                    //     title: 'Neutral (D65 White Point)',
                    //     color: Colors.orangeAccent),
                  ]),
            ),
          ],
        ));
  }
}
