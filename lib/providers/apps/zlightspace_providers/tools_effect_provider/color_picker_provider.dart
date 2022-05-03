import 'package:flutter/material.dart';
import 'package:hpx/models/tools_effect/color_picker_model.dart';
import 'package:hpx/widgets/components/color_picker.dart';

// waves lists
List<ColorPickerWidgetModel> waveDefaultsList = [
  ColorPickerWidgetModel(
      name: "Galaxy",
      colorCode: [
        Colors.red.shade900,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.red
      ],
      colorDirection: ""),
  ColorPickerWidgetModel(
      name: "Ocean",
      colorCode: [Colors.lightBlue],
      colorDirection: "",
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Jungle",
      colorCode: [Colors.greenAccent],
      colorDirection: "none",
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Volcano",
      colorCode: [Colors.deepOrange],
      colorDirection: "none",
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "OMEN",
      colorCode: [Colors.purple],
      colorDirection: "none",
      hasBorder: false)
];
List<ColorPickerWidgetModel> waveCustomList = [
  ColorPickerWidgetModel(
    action: 'Edit',
    name: "",
    canEdit: true,
    colorCode: [
      Colors.red.shade900,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.red
    ],
    colorDirection: "",
  )
];

// breathing lists
List<ColorPickerWidgetModel> breathingList = [
  ColorPickerWidgetModel(
    label: "Primary Color",
    action: '',
    width: 30.0,
    height: 30.0,
    name: "",
    colorCode: [Colors.red.shade900],
    setRandom: true,
  ),
  ColorPickerWidgetModel(
    label: "Secondary Color",
    action: '',
    width: 30.0,
    height: 30.0,
    name: "",
    colorCode: [Colors.yellow.shade900],
    setRandom: true,
  )
];

// blinking lists
List<ColorPickerWidgetModel> blinkingList = [
  ColorPickerWidgetModel(
    label: "Primary Color",
    action: '',
    width: 30.0,
    height: 30.0,
    name: "",
    colorCode: [Colors.red.shade900],
    setRandom: true,
  ),
  ColorPickerWidgetModel(
    label: "Secondary Color",
    action: '',
    width: 30.0,
    height: 30.0,
    name: "",
    colorCode: [Colors.yellow.shade900],
    setRandom: true,
  )
];

// color production lists
List<ColorPickerWidgetModel> colorProductionList = [
  ColorPickerWidgetModel(
    action: '',
    name: "Netural (D65 White Point)",
    colorCode: [Colors.yellow],
    colorDirection: "",
  )
];

// mood lists
List<ColorPickerWidgetModel> moodThemesList = [
  ColorPickerWidgetModel(
    action: '',
    name: "Night Mode",
    hasBorder: false,
    colorCode: [Colors.orangeAccent],
  ),
  ColorPickerWidgetModel(
    action: '',
    name: "Focus",
    hasBorder: false,
    colorCode: [Colors.lightBlue],
  ),
  ColorPickerWidgetModel(
    action: '',
    name: "Relax",
    hasBorder: false,
    colorCode: [Colors.greenAccent],
  ),
  ColorPickerWidgetModel(
    action: '',
    name: "Create",
    hasBorder: false,
    colorCode: [Colors.deepOrange],
  ),
  ColorPickerWidgetModel(
    action: '',
    name: "Ideate",
    hasBorder: false,
    colorCode: [Colors.purple],
  ),
];
List<ColorPickerWidgetModel> moodCustomList = [
  ColorPickerWidgetModel(
    action: 'Edit',
    name: "Custom 1",
    canEdit: true,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: 'Edit',
    name: "Custom 2",
    canEdit: true,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: 'Edit',
    canEdit: true,
    name: "Custom 3",
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: 'Edit',
    canEdit: true,
    name: "Custom 4",
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: 'Edit',
    canEdit: true,
    name: "Custom 5",
    colorCode: [Colors.transparent],
  ),
];

List<ColorPickerWidgetModel> audioVisualSolidList = [
  ColorPickerWidgetModel(
      label: "Primary Color",
      action: '',
      width: 30.0,
      height: 30.0,
      name: "",
      colorCode: [Colors.red.shade900]),
  ColorPickerWidgetModel(
      label: "Secondary Color",
      action: '',
      width: 30.0,
      height: 30.0,
      name: "",
      colorCode: [Colors.yellow.shade900]),
  ColorPickerWidgetModel(
      label: "Background Color",
      action: '',
      width: 30.0,
      height: 30.0,
      name: "",
      colorCode: [Colors.transparent])
];
List<ColorPickerWidgetModel> audioVisualGradientList = [
  ColorPickerWidgetModel(label: "", action: 'Edit', name: "", colorCode: [
    Colors.red.shade900,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.red
  ])
];

class ColorPickerProvider extends ChangeNotifier {
  ColorPickerWidgetModel? currentColor;

  void setCurrentPickerWidget(ColorPickerWidgetModel data) {
    currentColor = data;
    notifyListeners();
  }

  List<Widget> generateColorPickerWidget(List<ColorPickerWidgetModel> list) {
    List<Widget> generatedUI = [];
    for (ColorPickerWidgetModel element in list) {
      generatedUI.add(ColorPickerWidget(
        color: element.colorCode.first,
        colors: element.colorCode,
        title: element.name,
        width: element.width,
        height: element.height,
        label: element.label,
        hasBorder: element.hasBorder,
        leftTitle: element.action!,
        setRandom: element.setRandom,
        picker: element.canEdit,
      ));
    }
    return generatedUI;
  }
}
