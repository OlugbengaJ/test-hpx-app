import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/widgets/colors.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatefulWidget {
  ColorPickerWidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.colors,
      this.picker,
      this.label = "",
      this.hasBorder = true,
      this.onchange,
      this.setRandom = false,
      this.width,
      this.height,
      required this.leftTitle})
      : super(key: key);

  final String title;
  final String leftTitle;
  Color color;
  List<Color> colors;
  bool? picker;
  final bool? setRandom;
  bool? hasBorder;
  Function(List<Color> colors)? onchange;
  final double? width;
  final String? label;
  final double? height;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  BoxDecoration? previewBox;
  Timer? time;
  Color? currentColor;
  List<Color> currentColors = [];
  int colorPosition = 0;
  bool isHover = false;
  bool _value = false;
  bool isFocused = false;
  TextEditingController colorController = TextEditingController();

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
      setCurrentColor(currentColors[colorPosition]);
      generatePreviewBox(true);
    });
  }

  void setCurrentColor(Color selectedColor) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    colorPickerProviderInstance.setCurrentPickerWidget(ColorPickerWidgetModel(
      action: widget.title,
      name: widget.title,
      canEdit: widget.picker,
      colorCode: currentColors,
      label: colorPickerProviderInstance.currentColor?.label,
      setRandom: colorPickerProviderInstance.currentColor?.setRandom,
      hasBorder: colorPickerProviderInstance.currentColor?.hasBorder,
    ));
    widget.onchange!(widget.colors);
  }

  void closeDialog(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    setState(() {
      widget.colors = currentColors;
      colorPickerProviderInstance.lastColors.add(currentColor!);
    });
    Navigator.of(context).pop();
  }

  void selectcolor(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    currentColor = widget.color;
    List lastcolors = [
      colorPickerProviderInstance.lastColors.reversed.toList().take(9).toList(),
      colorPickerProviderInstance.lastColors.reversed
          .toList()
          .skip(9)
          .take(18)
          .toList(),
    ];
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
                Text("Color Editor",
                    textAlign: TextAlign.left, style: labelStyle),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: (widget.colors.length > 1) ? 250 : 30,
                          height: 20,
                          decoration: generatePreviewBox(true),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 0.0, left: 0.0),
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Solid Color",
                              textAlign: TextAlign.left, style: labelStyle),
                          SizedBox(
                              width: 200,
                              child: ColorPicker(
                                  hexInputBar: true,
                                  enableAlpha: true,
                                  paletteType: PaletteType.hueWheel,
                                  portraitOnly: true,
                                  colorPickerWidth: 200,
                                  displayThumbColor: true,
                                  hexInputController: colorController,
                                  pickerColor: (currentColor != null)
                                      ? currentColor!
                                      : widget.color,
                                  pickerAreaHeightPercent: 0.8,
                                  onColorChanged: (Color selectedcolor) {
                                    changeColor(selectedcolor);
                                  },
                                  colorHistory: (widget.colors.length == 1)
                                      ? []
                                      : widget.colors,
                                  onHistoryChanged: (List<Color> colors) {
                                    print(colors);
                                  })),
                        ],
                      ),
                      Container(margin: const EdgeInsets.only(left: 10.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Recent",
                                      textAlign: TextAlign.left,
                                      style: labelStyle),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    width: 50,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: Colors.grey.shade400),
                                        color: currentColors[colorPosition]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text("Preset", textAlign: TextAlign.left, style: labelStyle),
                Container(margin: const EdgeInsets.only(top: 7.0)),
                SizedBox(
                    width: 250,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(
                            9, colorPickerProviderInstance.presetColors[0]))),
                SizedBox(
                    width: 250,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(
                            9, colorPickerProviderInstance.presetColors[1]))),
                Container(margin: const EdgeInsets.only(bottom: 10.0)),
                Text("Current", textAlign: TextAlign.left, style: labelStyle),
                Container(margin: const EdgeInsets.only(top: 7.0)),
                SizedBox(
                    width: 250,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(9, lastcolors.first))),
                SizedBox(
                    width: 250,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(9, lastcolors[1]))),
                Container(margin: const EdgeInsets.only(bottom: 20.0)),
                Row(children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        TextButton(
                            child: const Text("Cancel"),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
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
                              backgroundColor: Colors.white,
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

  generatePresetBox(int len, List<Color> colors) {
    List<Widget> boxes = [];
    for (int i = 0; i < len; i++) {
      boxes.add(Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              colorController.text = colors[i].toHex();
            },
            child: Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(
                  top: 4.0, bottom: 4.0, right: 4, left: 4),
              decoration: BoxDecoration(
                  color: (colors.isNotEmpty) ? colors[i] : Colors.grey.shade800,
                  border: Border.all(width: 0, color: Colors.grey.shade400)),
            ),
          )
        ],
      ));
    }
    return boxes;
  }

  generatePreviewBox(bool? preview) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    return (widget.colors.length > 1 && preview == true)
        ? BoxDecoration(
            gradient: LinearGradient(colors: widget.colors),
            border: Border.all(
                width: (isFocused)
                    ? 2
                    : (isHover || widget.hasBorder == true)
                        ? 2
                        : 1,
                color: (isFocused)
                    ? Colors.white
                    : (isHover || widget.hasBorder == true)
                        ? Colors.white
                        : Colors.grey.shade700))
        : BoxDecoration(
            color: widget.color,
            border: Border.all(
                width: (isFocused)
                    ? 2
                    : (isHover || widget.hasBorder == true)
                        ? 2
                        : 1,
                color: (isFocused)
                    ? Colors.white
                    : (isHover || widget.hasBorder == true)
                        ? Colors.white
                        : Colors.grey.shade700));
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
            setState(() {
              isHover = false;
              widget.hasBorder = true;
            });
            widget.color = element;
            colorPosition = i;
            changeColor(element);
            (widget.picker == null || widget.picker == false)
                ? ''
                : selectcolor(context);
          },
          onHover: (bool hover) {
            setState(() {
              isHover = hover;
            });
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

  proccessRandom() {
    Color color = Colors.transparent;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
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
                InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isHover = false;
                        isFocused = true;
                        widget.hasBorder = true;
                        // widget.hasBorder = true;
                      });
                      (widget.picker == false) ? '' : selectcolor(context);
                    },
                    onHover: (bool hover) {
                      setState(() {
                        // isFocused = true;
                        isHover = hover;
                      });
                    },
                    child: Container(
                      width: (widget.width == null)
                          ? MediaQuery.of(context).size.width * 0.3
                          : widget.width,
                      height: (widget.width == null) ? 20.0 : widget.height,
                      // color: (currentColor != null) ? currentColor : widget.color,
                      decoration: generatePreviewBox(true),
                    )),
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
                      setState(() {
                        isHover = false;
                        isFocused = true;
                        widget.hasBorder = true;
                        // widget.hasBorder = true;
                      });
                      (widget.picker == false) ? '' : selectcolor(context);
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
                                activeColor: Colors.green,
                                value: _value,
                                onChanged: (bool? value) {
                                  ColorPickerProvider
                                      colorPickerProviderInstance =
                                      Provider.of<ColorPickerProvider>(context,
                                          listen: false);
                                  setState(() {
                                    _value = value!;
                                    widget.hasBorder = (!_value) ? true : false;
                                    widget.picker = (!_value) ? true : false;

                                    if (value == true) {
                                      time = Timer.periodic(
                                          const Duration(seconds: 1), (timer) {
                                        widget.onchange!([
                                          colorPickerProviderInstance
                                              .generateRandomColor()
                                        ]);
                                      });
                                    } else {
                                      time!.cancel();
                                      widget.onchange!([widget.color]);
                                    }
                                  });
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
