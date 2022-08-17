import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/utils/constants.dart';
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
      this.label = '',
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

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  bool isHover = false;
  bool isFocused = false;
  TextEditingController colorController = TextEditingController();

  void changeColor(Color selectedColor) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    setState(() {
      colorPickerProviderInstance.color = widget.color = selectedColor;
      colorPickerProviderInstance
              .currentColors[colorPickerProviderInstance.position] =
          widget.colors[colorPickerProviderInstance.position] = selectedColor;
    });
    // rebuildAllChildren(context);
    setCurrentColor();
  }

  void setCurrentColor() {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    colorPickerProviderInstance.setCurrentPickerWidget(ColorPickerWidgetModel(
      action: widget.title,
      name: widget.title,
      canEdit: widget.picker,
      colorCode: colorPickerProviderInstance.currentColors,
      label: colorPickerProviderInstance.currentColor.label,
      setRandom: colorPickerProviderInstance.currentColor.setRandom,
      hasBorder: colorPickerProviderInstance.currentColor.hasBorder,
    ));
    widget.onchange!(widget.colors);
  }

  void closeDialog(BuildContext context) {
    setLastColor();
    Navigator.of(context).pop();
    rebuildAllChildren(context);
  }

  void setLastColor() {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    if (colorPickerProviderInstance.lastColors.isNotEmpty) {
      if (colorPickerProviderInstance.lastColors
              .contains(colorPickerProviderInstance.color) ==
          false) {
        colorPickerProviderInstance.lastColors
            .add(colorPickerProviderInstance.color);
      }
    }
  }

  void selectcolor(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    setState(() {
      colorPickerProviderInstance.currentColors = widget.colors;
      colorPickerProviderInstance.color = widget.color;
    });
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
                (widget.colors.length < 2)
                    ? Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      )
                    : const GradientSelector(),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: (widget.colors.length > 1) ? 250 : 30,
                            height: 20,
                            child: ColorPickerBox(
                              hover: false,
                              focus: false,
                              hasBorder: true,
                              showGradientPicker: true,
                              onSelected: (Color newcolor, int position) {
                                setState(() {
                                  colorPickerProviderInstance.position =
                                      position;
                                  colorController.text =
                                      colorPickerProviderInstance
                                          .currentColors[position]
                                          .toHex();
                                });
                              },
                              colors: colorPickerProviderInstance.currentColors,
                            )),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              (widget.colors.length > 1)
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
                                  colorPickerWidth: 180,
                                  displayThumbColor: true,
                                  hexInputController: colorController,
                                  pickerColor:
                                      colorPickerProviderInstance.color,
                                  pickerAreaHeightPercent: 0.8,
                                  onColorChanged: (Color selectedcolor) {
                                    setState(() {
                                      colorController.text =
                                          selectedcolor.toHex();
                                    });
                                    changeColor(selectedcolor);
                                  },
                                  colorHistory: (widget.colors.length == 1)
                                      ? []
                                      : widget.colors)),
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
                                        color: colorPickerProviderInstance
                                            .lastColors.last,
                                        border: Border.all(
                                            width: 0.5, color: Colors.white),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 7.0),
                    child: SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Text(Constants.preset,
                                textAlign: TextAlign.left, style: labelStyle),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: generatePresetBox(
                                    9,
                                    colorPickerProviderInstance
                                        .presetColors[0])),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: generatePresetBox(
                                    9,
                                    colorPickerProviderInstance
                                        .presetColors[1]))
                          ],
                        ))),
                Container(
                    margin: const EdgeInsets.only(bottom: 10.0, top: 7.0),
                    child: Text(Constants.current,
                        textAlign: TextAlign.left, style: labelStyle)),
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
                              if (colorPickerProviderInstance
                                  .lastColors.isNotEmpty) {
                                changeColor(colorPickerProviderInstance
                                    .lastColors.last);
                              }
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

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    setState(() {
      if (widget.colors.length > 1) {
        Provider.of<ColorPickerProvider>(context, listen: false).currentColors =
            widget.colors;
      }
    });
    return Container(
        margin:
            const EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.label == '')
                ? Container()
                : Text(widget.label!,
                    textAlign: TextAlign.left, style: h5Style),
            Container(
                width: widget.width,
                margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: ColorPickerBox(
                  hover: isHover,
                  focus: isFocused,
                  hasBorder: widget.hasBorder!,
                  colors: widget.colors,
                  onSelected: (Color selectedColor, int position) {
                    setState(() {
                      if (widget.colors.length == 1) {
                        Provider.of<ColorPickerProvider>(context, listen: false)
                            .currentColors = widget.colors;
                      }
                      if (widget.picker == false) {
                        changeColor(selectedColor);
                        isHover = false;
                        // isFocused = true;
                        widget.hasBorder = false;
                      } else {
                        selectcolor(context);
                      }
                    });
                  },
                )),
            (widget.setRandom == false)
                ? InkWell(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        if (widget.colors.length < 2) {
                          Provider.of<ColorPickerProvider>(context,
                                  listen: false)
                              .currentColors = widget.colors;
                        }
                        if (widget.picker == false) {
                          // isHover = false;
                          // isFocused = true;
                          // widget.hasBorder = false;
                        } else {
                          selectcolor(context);
                        }
                      });
                      rebuildAllChildren(context);
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
                  )
                : Container(
                    margin: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                    child: RandomColorPicker(
                      onChange: (Color? newcolor) {
                        setState(() {
                          widget.hasBorder = (newcolor != null) ? false : true;
                          isFocused = true;
                          widget.onchange!([newcolor ?? widget.color]);
                        });
                        rebuildAllChildren(context);
                      },
                    ))
          ],
        ));
  }
}

class ColorPickerBox extends StatefulWidget {
  ColorPickerBox(
      {Key? key,
      required this.colors,
      required this.onSelected,
      this.hasBorder,
      this.hover,
      this.focus,
      this.showGradientPicker = false})
      : super(key: key);
  final Function(Color color, int position) onSelected;
  final List<Color> colors;
  final bool? showGradientPicker;
  final bool? hasBorder;
  bool? hover;
  bool? focus;

  @override
  State<ColorPickerBox> createState() => _ColorPickerBox();
}

class _ColorPickerBox extends State<ColorPickerBox> {
  Widget generateGradientClickBoxes(BuildContext context) {
    List<Widget> ui = [];
    for (int i = 0; i < widget.colors.length; i++) {
      Color element = widget.colors[i];
      ui.add(InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            widget.onSelected(element, i);
          },
          child: Container(
              margin: const EdgeInsets.only(bottom: 2.5),
              alignment: Alignment.center,
              width: 250 / widget.colors.length,
              child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(100))))));
    }
    return Wrap(
      children: ui,
    );
  }

  BoxDecoration generatePreviewBox() {
    return (widget.colors.length > 1)
        ? BoxDecoration(
            gradient: (Provider.of<ColorPickerProvider>(context, listen: false)
                        .gradientType ==
                    ColorGradientEnum.linear)
                ? LinearGradient(colors: widget.colors)
                : RadialGradient(colors: widget.colors),
            // gradient: LinearGradient(colors: widget.colors),
            border: Border.all(
                width: 2,
                color: (widget.hasBorder == true ||
                        widget.hover == true ||
                        widget.focus == true)
                    ? Colors.white
                    : Colors.transparent))
        : BoxDecoration(
            color: widget.colors[0],
            border: Border.all(
                width: 2,
                color: (widget.hasBorder == true ||
                        widget.hover == true ||
                        widget.focus == true)
                    ? Colors.white
                    : Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (bool? hover) {
          setState(() {
            widget.hover = hover!;
          });
        },
        onTap: () {
          if (widget.colors.length == 1 ||
              (widget.colors.length > 1 &&
                  widget.showGradientPicker == false)) {
            widget.onSelected(widget.colors[0], 0);
          }
        },
        child: Stack(children: [
          Container(
            height: 20.0,
            decoration: generatePreviewBox(),
          ),
          Positioned(
              bottom: 0,
              child: (widget.colors.length > 1 &&
                      widget.showGradientPicker == true)
                  ? generateGradientClickBoxes(context)
                  : Container())
        ]));
  }
}

class GradientSelector extends StatefulWidget {
  const GradientSelector({Key? key}) : super(key: key);

  @override
  State<GradientSelector> createState() => _GradientSelector();
}

class _GradientSelector extends State<GradientSelector> {
  @override
  Widget build(BuildContext context) {
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    return Row(
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            setState(() {
              colorPickerProviderInstance
                  .choooseGradientType(ColorGradientEnum.linear);
            });
          },
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 10.0, bottom: 4.0, right: 10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFCFCFCF), Color(0xFF878787)]),
                border: Border.all(
                    width: 2,
                    color: (colorPickerProviderInstance.gradientType ==
                            ColorGradientEnum.radial)
                        ? Colors.transparent
                        : Colors.white)),
          ),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            setState(() {
              colorPickerProviderInstance
                  .choooseGradientType(ColorGradientEnum.radial);
            });
          },
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 10.0, bottom: 4.0, right: 5),
            decoration: BoxDecoration(
                gradient: const RadialGradient(
                    colors: [Color(0xFFC7C7C7), Color(0xFF757575)]),
                border: Border.all(
                    width: 2,
                    color: (colorPickerProviderInstance.gradientType ==
                            ColorGradientEnum.linear)
                        ? Colors.transparent
                        : Colors.white)),
          ),
        ),
      ],
    );
  }
}

class RandomColorPicker extends StatefulWidget {
  const RandomColorPicker({Key? key, required this.onChange}) : super(key: key);
  final Function(Color? color) onChange;

  @override
  State<RandomColorPicker> createState() => _RandomColorPicker();
}

class _RandomColorPicker extends State<RandomColorPicker> {
  Timer? time;
  bool _value = false;
  ColorPickerProvider colorPickerProviderInstance = ColorPickerProvider();

  @override
  void dispose() {
    // TODO: implement dispose
    time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    setState(() {
                      _value = (_value == true) ? false : true;
                    });

                    if (value == true) {
                      time =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        widget.onChange(
                            colorPickerProviderInstance.generateRandomColor());
                      });
                    } else {
                      time!.cancel();
                      widget.onChange(null);
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
                        textAlign: TextAlign.left, style: labelStyle),
                  ],
                ))
          ]),
        ],
      ),
    );
  }
}
