import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/widgets/theme.dart';

Color pickerColor = const Color(0xff443a49);
Color currentColor = const Color(0xff443a49);

class Color_Picker extends StatefulWidget {
  Color_Picker(
      {Key? key,
      required this.title,
      required this.color,
      this.size,
      required this.leftTitle})
      : super(key: key);

  final String title;
  final String leftTitle;
  final Color color;
  final String? size;

  @override
  State<Color_Picker> createState() => _Color_PickerState();
}

class _Color_PickerState extends State<Color_Picker> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void selectcolor() {
    showDialog(
        // barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: const Text('Pick a color!'),
              alignment: Alignment.topRight,
              // insetPadding: EdgeInsets.only(top: 100, right: 330),
              contentPadding: const EdgeInsets.only(
                  top: 20, right: 10, bottom: 20, left: 10),
              children: <Widget>[
                ColorPicker(
                  hexInputBar: true,
                  enableAlpha: true,
                  portraitOnly: true,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
                TextButton(
                    child: const Text("Got It"),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
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
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 0.0, bottom: 10.0),
                child: TextButton(
                  child: const Text(""),
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 1),
                    minimumSize: (widget.size == 'box')
                        ? const Size(30.0, 30.0)
                        : const Size(100, 20),
                    maximumSize: (widget.size == 'box')
                        ? const Size(30.0, 30.0)
                        : const Size(100, 20),
                    primary: Colors.black,
                    backgroundColor: widget.color,
                  ),
                  onPressed: () {
                    pickerColor = widget.color;
                    selectcolor();
                  },
                )),
            Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      textAlign: TextAlign.left, style: labelStyle),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.leftTitle,
                      textAlign: TextAlign.right, style: labelStyle),
                ],
              ))
            ]),
            Container(margin: const EdgeInsets.only(bottom: 10.0))
          ],
        ));
  }
}
