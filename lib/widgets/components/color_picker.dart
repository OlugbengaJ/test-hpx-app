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
      this.width,
      this.height,
      required this.leftTitle})
      : super(key: key);

  final String title;
  final String leftTitle;
  final Color color;
  final double? width;
  final double? height;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  pickerColor = widget.color;
                  selectcolor();
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey, width: 1),
                  // ),
                  width: (widget.width == null)
                      ? MediaQuery.of(context).size.width * 0.3
                      : widget.width,
                  height: (widget.width == null) ? 20.0 : widget.height,
                  decoration: BoxDecoration(
                      color: widget.color,
                      // Red border with the width is equal to 5
                      border: Border.all(width: 1, color: Colors.grey)),
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
