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
      this.picker,
      this.width,
      this.height,
      required this.leftTitle})
      : super(key: key);

  final String title;
  final String leftTitle;
  final Color color;
  final bool? picker;
  final double? width;
  final double? height;

  @override
  State<Color_Picker> createState() => _Color_PickerState();
}

class _Color_PickerState extends State<Color_Picker> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void setCurrentColor(Color color) {
    setState(() => {currentColor = color});
    closeDialog();
  }

  void closeDialog() {
    setState(() {});
    Navigator.of(context).pop();
  }

  void selectcolor() {
    showDialog(
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
              alignment: Alignment.topRight,
              insetPadding: EdgeInsets.only(
                  top: 100, right: MediaQuery.of(context).size.width * 0.175),
              contentPadding: const EdgeInsets.only(
                  top: 20, right: 10, bottom: 20, left: 10),
              children: <Widget>[
                Text("Current Color",
                    textAlign: TextAlign.left, style: h4Style),
                Container(
                    width: 30.0,
                    height: 30.0,
                    color: pickerColor,
                    margin: const EdgeInsets.only(top: 10.0, bottom: 20.0)),
                Text("Color Picker", textAlign: TextAlign.left, style: h4Style),
                Container(margin: const EdgeInsets.only(top: 10.0)),
                ColorPicker(
                  hexInputBar: true,
                  enableAlpha: true,
                  // paletteType: PaletteType.hsvWithValue,
                  portraitOnly: true,
                  colorPickerWidth: 200,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0)),
                Row(children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        TextButton(
                            child: const Text("Cancel"),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red.shade900,
                            ),
                            onPressed: () {
                              closeDialog();
                            })
                      ])),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: Colors.transparent,
                    indent: 20,
                    endIndent: 0,
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        TextButton(
                            child: const Text("Got It"),
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white70,
                            ),
                            onPressed: () {
                              setCurrentColor(pickerColor);
                            })
                      ])),
                ]),
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
                  currentColor = pickerColor = widget.color;
                  (widget.picker == null || widget.picker == false)
                      ? ''
                      : selectcolor();
                },
                child: Container(
                  width: (widget.width == null)
                      ? MediaQuery.of(context).size.width * 0.3
                      : widget.width,
                  height: (widget.width == null) ? 30.0 : widget.height,
                  decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(width: 1, color: Colors.grey)),
                )),
            Container(margin: const EdgeInsets.only(top: 5.0)),
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
