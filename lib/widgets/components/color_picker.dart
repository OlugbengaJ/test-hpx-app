import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/colors.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatelessWidget {
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
      required this.context,
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
  final BuildContext context;
  final double? height;

  BoxDecoration? previewBox;
  Timer? time;
  Color? currentColor;
  List<Color> currentColors = [];
  int colorPosition = 0;
  bool isHover = false;
  bool _value = false;
  bool isFocused = false;
  TextEditingController colorController = TextEditingController();

  void initState() {
    // TODO: implement initState
    currentColors = colors;
  }

  void changeColor(Color selectedColor) {
    currentColors[colorPosition] = color = currentColor = selectedColor;
    setCurrentColor();
    generatePreviewBox(true);
  }

  void setCurrentColor() {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    colorPickerProviderInstance.setCurrentPickerWidget(ColorPickerWidgetModel(
      action: title,
      name: title,
      canEdit: picker,
      colorCode: currentColors,
      label: colorPickerProviderInstance.currentColor?.label,
      setRandom: colorPickerProviderInstance.currentColor?.setRandom,
      hasBorder: colorPickerProviderInstance.currentColor?.hasBorder,
    ));
    onchange!(colors);
  }

  void closeDialog(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    colors = currentColors;
    if (colorPickerProviderInstance.lastColors.contains(currentColor) ==
        false) {
      colorPickerProviderInstance.lastColors.add(currentColor!);
    }
    Navigator.of(context).pop();
  }

  void selectcolor(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    currentColor = color;
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
                Text(Constants.colorEditor,
                    textAlign: TextAlign.left, style: labelStyle),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: (colors.length > 1) ? 250 : 30,
                          height: 20,
                          decoration: generatePreviewBox(true),
                        ),
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
                          Text(
                              (colors.length > 1)
                                  ? Constants.gradientColor
                                  : Constants.solidColor,
                              textAlign: TextAlign.left,
                              style: labelStyle),
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
                                      : color,
                                  pickerAreaHeightPercent: 0.8,
                                  onColorChanged: (Color selectedcolor) {
                                    changeColor(selectedcolor);
                                  },
                                  colorHistory:
                                      (colors.length == 1) ? [] : colors)),
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
                                  Text(Constants.recent,
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
                Text(Constants.preset,
                    textAlign: TextAlign.left, style: labelStyle),
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
                Text(Constants.current,
                    textAlign: TextAlign.left, style: labelStyle),
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
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              changeColor(
                                  colorPickerProviderInstance.lastColors.last);
                              closeDialog(context);
                            },
                            child: const Text(Constants.cancel))
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
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setCurrentColor();
                              closeDialog(context);
                            },
                            child: const Text(Constants.gotIt))
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
    return (colors.length > 1 && preview == true)
        ? BoxDecoration(
            gradient: LinearGradient(colors: colors),
            border: Border.all(
                width: (isFocused)
                    ? 2
                    : (isHover || hasBorder == true)
                        ? 2
                        : 1,
                color: (isFocused)
                    ? Colors.white
                    : (isHover || hasBorder == true)
                        ? Colors.white
                        : Colors.grey.shade700))
        : BoxDecoration(
            color: color,
            border: Border.all(
                width: (isFocused)
                    ? 2
                    : (isHover || hasBorder == true)
                        ? 2
                        : 1,
                color: (isFocused)
                    ? Colors.white
                    : (isHover || hasBorder == true)
                        ? Colors.white
                        : Colors.grey.shade700));
  }

  generateGradientClickBoxes(BuildContext context) {
    List<Widget> ui = [];
    currentColors = colors;
    for (int i = 0; i < currentColors.length; i++) {
      Color element = currentColors[i];
      ui.add(InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            isHover = false;
            hasBorder = true;
            color = element;
            colorPosition = i;
            changeColor(element);
            (picker == null || picker == false) ? '' : selectcolor(context);
          },
          onHover: (bool hover) {
            isHover = hover;
          },
          child: Container(
            width: (width == null)
                ? (MediaQuery.of(context).size.width * 0.18) /
                    currentColors.length
                : width,
            height: (width == null) ? 20.0 : height,
            color: Colors.transparent,
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
    context = context;
    return Container(
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (label == '')
                ? Container()
                : Text(label!, textAlign: TextAlign.left, style: h5Style),
            Container(margin: const EdgeInsets.only(top: 10.0)),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      isHover = false;
                      isFocused = true;
                      hasBorder = true;
                      (picker == false) ? '' : selectcolor(context);
                    },
                    onHover: (bool hover) {
                      isHover = hover;
                    },
                    child: Container(
                      width: (width == null)
                          ? MediaQuery.of(context).size.width * 0.3
                          : width,
                      height: (width == null) ? 20.0 : height,
                      decoration: generatePreviewBox(true),
                    )),
                Positioned(
                    bottom: 0, child: generateGradientClickBoxes(context)),
              ],
            ),
            Container(margin: const EdgeInsets.only(top: 5.0)),
            (setRandom == true)
                ? Container(margin: const EdgeInsets.only(top: 5.0))
                : InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      isHover = false;
                      isFocused = true;
                      hasBorder = true;
                      (picker == false) ? '' : selectcolor(context);
                    },
                    child: Row(children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              textAlign: TextAlign.left, style: labelStyle),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(leftTitle,
                              textAlign: TextAlign.right, style: labelStyle),
                        ],
                      ))
                    ]),
                  ),
            (setRandom == false)
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
                                  _value = value!;
                                  hasBorder = (!_value) ? true : false;
                                  picker = (!_value) ? true : false;

                                  if (value == true) {
                                    time = Timer.periodic(
                                        const Duration(seconds: 1), (timer) {
                                      onchange!([
                                        colorPickerProviderInstance
                                            .generateRandomColor()
                                      ]);
                                    });
                                  } else {
                                    time!.cancel();
                                    onchange!([color]);
                                  }
                                },
                              )
                            ],
                          )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Constants.randomColor,
                                      textAlign: TextAlign.left,
                                      style: labelStyle),
                                ],
                              ))
                        ]),
                      ],
                    ),
                  ),
            (setRandom == false)
                ? Container()
                : Container(margin: const EdgeInsets.only(bottom: 20.0))
          ],
        ));
  }
}
