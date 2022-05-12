import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/effects_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
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
  Color currentColor = Colors.transparent;
  Color lastColor = Colors.transparent;
  List<Color> currentColors = [];
  int colorPosition = 0;
  bool isHover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentColors = widget.colors;
    });
  }

  void changeColor(BuildContext context, Color selectedColor) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    EffectProvider effectProvider =
        Provider.of<EffectProvider>(context, listen: false);
    ColorPickerProvider colorPickerProviderInstance =
        Provider.of<ColorPickerProvider>(context, listen: false);
    setState(() {
      currentColors[colorPosition] =
          widget.color = currentColor = selectedColor;
    });
    colorPickerProviderInstance.setCurrentPickerWidget(ColorPickerWidgetModel(
      action: widget.title,
      name: widget.title,
      canEdit: widget.picker,
      colorCode: currentColors,
    ));
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: currentColors,
        value: modeProvider.currentMode.value,
        effects: modeProvider.currentMode.effects,
        name: modeProvider.currentMode.name));
    generatePreviewBox(true);
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
                    textAlign: TextAlign.left, style: labelStyle),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: (widget.colors.length > 1) ? 310 : 30,
                          height: 25,
                          decoration: generatePreviewBox(true),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 0.0, left: 0.0),
                  width: 300,
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
                              width: 250,
                              child: ColorPicker(
                                  hexInputBar: true,
                                  enableAlpha: true,
                                  // pickerAreaBorderRadius: BorderRadius.only(topLeft: ),
                                  paletteType: PaletteType.hueWheel,
                                  portraitOnly: true,
                                  colorPickerWidth: 200,
                                  displayThumbColor: true,
                                  pickerColor: widget.color,
                                  onColorChanged: (Color selectedcolor) {
                                    changeColor(context, selectedcolor);
                                  },
                                  colorHistory: (widget.colors.length == 1)
                                      ? []
                                      : widget.colors,
                                  onHistoryChanged: (List<Color> colors) {
                                    print(colors);
                                  })),
                        ],
                      ),
                      // Container(margin: const EdgeInsets.only(left: 5.0)),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text("Opacity",
                      //         textAlign: TextAlign.left, style: labelStyle),
                      //   ],
                      // ),
                      Container(margin: const EdgeInsets.only(left: 10.0)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("New",
                              textAlign: TextAlign.left, style: labelStyle),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade400),
                                        color: currentColors[colorPosition]),
                                  ),
                                  Text("Current",
                                      textAlign: TextAlign.left,
                                      style: labelStyle),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
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
                // Text("Preset", textAlign: TextAlign.left, style: labelStyle),
                // Container(margin: const EdgeInsets.only(top: 7.0)),
                // SizedBox(
                //     width: 290,
                //     child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: generatePresetBox(9))),
                // SizedBox(
                //     width: 290,
                //     child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: generatePresetBox(9))),
                // Container(margin: const EdgeInsets.only(bottom: 10.0)),
                Text("Current", textAlign: TextAlign.left, style: labelStyle),
                Container(margin: const EdgeInsets.only(top: 7.0)),
                SizedBox(
                    width: 300,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(9))),
                SizedBox(
                    width: 300,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: generatePresetBox(9))),
                Container(margin: const EdgeInsets.only(bottom: 20.0)),
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

  generatePresetBox(int len) {
    List<Widget> boxes = [];
    for (int i = 0; i < len; i++) {
      boxes.add(Column(
        children: [
          Container(
            width: 25,
            height: 25,
            margin:
                const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4, left: 4),
            decoration: BoxDecoration(
                // color: widget.color,
                border: Border.all(width: 0, color: Colors.grey.shade400)),
          )
        ],
      ));
    }
    return boxes;
  }

  generatePreviewBox(bool? preview) {
    return (widget.colors.length > 1 && preview == true)
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
                  decoration: generatePreviewBox(true),
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
