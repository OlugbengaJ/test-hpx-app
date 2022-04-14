import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/widgets/theme.dart';

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

class _Color_PickerState extends State<Color_Picker> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void selectcolor() {
    showDialog(
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: const Text('Pick a color!'),
              alignment: Alignment.topRight,
              insetPadding: EdgeInsets.only(top: 100, right: 330),
              contentPadding:
                  EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
              children: <Widget>[
                ColorPicker(
                  hexInputBar: true,
                  enableAlpha: true,
                  portraitOnly: true,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
                FlatButton(
                    child: const Text('Got it'),
                    color: Colors.grey,
                    onPressed: () {
                      setState(() => currentColor = pickerColor);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 15.0, right: 0.0, bottom: 10.0),
              child: FlatButton(
                textColor: Colors.black,
                height: 18.0,
                color: widget.color,
                shape: Border.all(width: 0, color: Colors.grey),
                child: Text(''),
                onPressed: () {
                  selectcolor();
                },
              ),
            ),
            Text(widget.title, textAlign: TextAlign.left, style: labelStyle),
          ],
        ));
  }
}
