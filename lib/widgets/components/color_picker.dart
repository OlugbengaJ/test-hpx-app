import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/models/tools_effect/color_picker_model.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/widgets/theme.dart';

class ColorPickerWidget extends StatefulWidget {
  ColorPickerWidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.colors,
      this.picker,
      this.label = "",
      this.hasBorder = true,
      this.setRandom = false,
      this.width,
      this.height,
      required this.leftTitle})
      : super(key: key);

  final String title;
  final String leftTitle;
  Color color;
  List<Color> colors;
  final bool? picker;
  final bool? setRandom;
  final bool? hasBorder;
  final double? width;
  final String? label;
  final double? height;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  BoxDecoration? previewBox;
  Color? currentColor;
  List<Color> currentColors = [];
  int colorPosition = 0;
  bool isHover = false;
  var colorPickerProviderInstance = ColorPickerProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentColors = widget.colors;
    });
  }

  void changeColor(Color selectedColor) {
    setState(() {
      currentColors[colorPosition] =
          widget.color = currentColor = selectedColor;
    });

    colorPickerProviderInstance.getCurrentPickerWidget(ColorPickerWidgetModel(
      action: widget.title,
      name: widget.title,
      canEdit: widget.picker,
      colorCode: currentColors,
    ));
    generatePreviewBox();
  }

  void setCurrentColor(Color selectedColor) {
    setState(() {
      currentColors[colorPosition] =
          widget.color = currentColor = selectedColor;
    });
  }

  void closeDialog(BuildContext context) {
    setState(() {
      widget.colors = currentColors;
    });
    Navigator.of(context).pop();
  }

  void selectcolor(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
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
                    height: 20.0,
                    // color: currentColor ?? widget.color,
                    decoration: generatePreviewBox(),
                    margin: const EdgeInsets.only(top: 10.0, bottom: 20.0)),
                Text("Color Picker", textAlign: TextAlign.left, style: h4Style),
                Container(margin: const EdgeInsets.only(top: 10.0)),
                ColorPicker(
                  hexInputBar: true,
                  enableAlpha: false,
                  paletteType: PaletteType.hsv,
                  portraitOnly: true,
                  colorPickerWidth: 200,
                  displayThumbColor: true,
                  pickerColor: widget.color,
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
                              primary: Colors.white70,
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              closeDialog(context);
                            })
                      ])),
                  const VerticalDivider(
                    width: 10,
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
                              setCurrentColor(widget.color);
                              closeDialog(context);
                            })
                      ])),
                ]),
              ]);
        });
  }

  generatePreviewBox() {
    return (widget.colors.length > 1)
        ? BoxDecoration(
            gradient: LinearGradient(colors: widget.colors),
            border: Border.all(
                width: (isHover && widget.hasBorder == false) ? 2 : 1,
                color: (!isHover && widget.hasBorder == false)
                    ? Colors.grey.shade700
                    : Colors.grey.shade400))
        : BoxDecoration(
            color: widget.color,
            border: Border.all(
                width: (isHover && widget.hasBorder == false) ? 2 : 1,
                color: (!isHover && widget.hasBorder == false)
                    ? Colors.grey.shade700
                    : Colors.grey.shade400));
  }

  generateGradientClickBoxes(BuildContext context) {
    List<Widget> ui = [];
    currentColors = widget.colors;
    for (int i = 0; i < currentColors.length; i++) {
      Color element = currentColors[i];
      ui.add(InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            widget.color = element;
            colorPosition = i;
            (widget.picker == null || widget.picker == false)
                ? ''
                : selectcolor(context);
          },
          onHover: (bool hover) {
            isHover = hover;
            // (isHover) ? '' : setCurrentColor(element);
          },
          child: Container(
            width: (widget.width == null)
                ? (MediaQuery.of(context).size.width * 0.18) /
                    currentColors.length
                : widget.width,
            height: (widget.width == null) ? 20.0 : widget.height,
            color: Colors.transparent,
            // color: element,
          )));
    }
    return Row(
      children: ui,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.label == "")
                ? Container()
                : Text(widget.label!,
                    textAlign: TextAlign.left, style: h5Style),
            Container(margin: const EdgeInsets.only(top: 10.0)),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: (widget.width == null)
                      ? MediaQuery.of(context).size.width * 0.3
                      : widget.width,
                  height: (widget.width == null) ? 20.0 : widget.height,
                  // color: (currentColor != null) ? currentColor : widget.color,
                  decoration: generatePreviewBox(),
                ),
                Positioned(
                    bottom: 0, child: generateGradientClickBoxes(context)),
              ],
            ),
            Container(margin: const EdgeInsets.only(top: 5.0)),
            (widget.setRandom == true)
                ? Container(margin: const EdgeInsets.only(top: 5.0))
                : InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      (widget.picker == null || widget.picker == false)
                          ? ''
                          : selectcolor(context);
                    },
                    child: Row(children: [
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
                  ),
            (widget.setRandom == false)
                ? Container()
                : SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {
                                  // this.value = value;
                                },
                              )
                            ],
                          )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Random Color",
                                      textAlign: TextAlign.left,
                                      style: labelStyle),
                                ],
                              ))
                        ]),
                      ],
                    ),
                  ),
            (widget.setRandom == false)
                ? Container()
                : Container(margin: const EdgeInsets.only(bottom: 20.0))
          ],
        ));
  }
}
