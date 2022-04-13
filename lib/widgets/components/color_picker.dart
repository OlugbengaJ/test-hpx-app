import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Color pickerColor = Color(0xff443a49);
Color currentColor = Color(0xff443a49);

class Color_Picker extends StatefulWidget {
  const Color_Picker({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<Color_Picker> createState() => _Color_PickerState();
}

void select_color() => (Color color) {
      // setState(() => pickerColor = color);
    };

class _Color_PickerState extends State<Color_Picker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 15.0, right: 0.0, bottom: 7.0),
              child: FlatButton(
                textColor: Colors.black,
                height: 30.0,
                color: widget.color,
                shape: Border.all(width: 2, color: Colors.white),
                child: Text(''),
                onPressed: select_color,
              ),
            ),
            Text(widget.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ));
  }
}
