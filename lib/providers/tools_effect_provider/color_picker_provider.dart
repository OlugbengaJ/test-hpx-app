import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:provider/provider.dart';

// colorcycle pickermodel lists
List<ColorPickerWidgetModel> colorcycleDefaultsList = [
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
  ),
  ColorPickerWidgetModel(
      name: "Ocean",
      colorCode: [
        Colors.blue,
        Colors.blue.shade900,
        Colors.purple,
        Colors.blue.shade100
      ],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Jungle",
      colorCode: [
        Colors.green,
        Colors.green.shade200,
        Colors.blue,
        Colors.orange,
        Colors.green.shade900
      ],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Volcano",
      colorCode: [Colors.deepOrange, Colors.red, Colors.brown, Colors.orange],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "OMEN",
      colorCode: [
        Colors.purple,
        Colors.red,
        Colors.orange,
        Colors.purple.shade100
      ],
      hasBorder: false)
];
List<ColorPickerWidgetModel> colorcycleCustomList = [
  ColorPickerWidgetModel(
    action: Constants.edit,
    name: Constants.nullValue,
    canEdit: true,
    colorCode: [
      Colors.red.shade900,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.red
    ],
  )
];

// waves mode pickermodel lists
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
  ),
  ColorPickerWidgetModel(
      name: "Ocean",
      colorCode: [
        Colors.blue,
        Colors.blue.shade900,
        Colors.purple,
        Colors.blue.shade100
      ],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Jungle",
      colorCode: [
        Colors.green,
        Colors.green.shade200,
        Colors.blue,
        Colors.orange,
        Colors.green.shade900
      ],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "Volcano",
      colorCode: [Colors.deepOrange, Colors.red, Colors.brown, Colors.orange],
      hasBorder: false),
  ColorPickerWidgetModel(
      name: "OMEN",
      colorCode: [
        Colors.purple,
        Colors.red,
        Colors.orange,
        Colors.purple.shade100
      ],
      hasBorder: false)
];
List<ColorPickerWidgetModel> waveCustomList = [
  ColorPickerWidgetModel(
    action: Constants.edit,
    name: Constants.nullValue,
    canEdit: true,
    colorCode: [
      Colors.red.shade900,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.red
    ],
  )
];

// breathing pickermodel lists
List<ColorPickerWidgetModel> breathingList = [
  ColorPickerWidgetModel(
    label: "Primary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.red.shade900],
    setRandom: true,
  ),
  ColorPickerWidgetModel(
    label: "Secondary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.yellow.shade900],
    setRandom: true,
  )
];

// interactive pickermodel lists
List<ColorPickerWidgetModel> interactiveColorList = [
  ColorPickerWidgetModel(
    label: "Primary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.red.shade900],
    setRandom: true,
  ),
  ColorPickerWidgetModel(
    label: "Secondary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.yellow.shade900],
    setRandom: true,
  )
];

// blinking pickermodel lists
List<ColorPickerWidgetModel> blinkingList = [
  ColorPickerWidgetModel(
    label: "Primary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.red.shade900],
    setRandom: true,
  ),
  ColorPickerWidgetModel(
    label: "Secondary Color",
    action: Constants.nullValue,
    width: 30.0,
    height: 30.0,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.yellow.shade900],
    setRandom: true,
  )
];

// shortcut pickermodel lists
List<ColorPickerWidgetModel> shortcutList = [
  ColorPickerWidgetModel(
    label: Constants.nullValue,
    action: Constants.nullValue,
    canEdit: true,
    name: "sublayer",
    colorCode: [Colors.transparent],
  )
];

// shortcut pickermodel lists
List<ColorPickerWidgetModel> contactsupportlist = [
  ColorPickerWidgetModel(
    label: Constants.nullValue,
    action: Constants.nullValue,
    canEdit: true,
    name: Constants.nullValue,
    colorCode: [Colors.blue],
  )
];

// color production pickermodel lists
List<ColorPickerWidgetModel> colorProductionList = [
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Netural (D65 White Point)",
    colorCode: [Colors.yellow],
  )
];

// mood pickermodel lists
List<ColorPickerWidgetModel> moodThemesList = [
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Night Mode",
    hasBorder: true,
    colorCode: [Colors.orangeAccent],
  ),
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Focus",
    hasBorder: false,
    colorCode: [Colors.lightBlue],
  ),
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Relax",
    hasBorder: false,
    colorCode: [Colors.greenAccent],
  ),
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Create",
    hasBorder: false,
    colorCode: [Colors.deepOrange],
  ),
  ColorPickerWidgetModel(
    action: Constants.nullValue,
    name: "Ideate",
    hasBorder: false,
    colorCode: [Colors.purple],
  ),
];
List<ColorPickerWidgetModel> moodCustomList = [
  ColorPickerWidgetModel(
    action: Constants.edit,
    name: Constants.custom1,
    canEdit: true,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: Constants.edit,
    name: Constants.custom2,
    canEdit: true,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: Constants.edit,
    canEdit: true,
    name: Constants.custom3,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: Constants.edit,
    canEdit: true,
    name: Constants.custom4,
    colorCode: [Colors.transparent],
  ),
  ColorPickerWidgetModel(
    action: Constants.edit,
    canEdit: true,
    name: Constants.custom5,
    colorCode: [Colors.transparent],
  ),
];

List<ColorPickerWidgetModel> audioVisualSolidList = [
  ColorPickerWidgetModel(
      canEdit: true,
      label: "Primary Color",
      action: Constants.nullValue,
      width: 30.0,
      height: 30.0,
      name: Constants.nullValue,
      colorCode: [Colors.red.shade900]),
  ColorPickerWidgetModel(
      canEdit: true,
      label: "Secondary Color",
      action: Constants.nullValue,
      width: 30.0,
      height: 30.0,
      name: Constants.nullValue,
      colorCode: [Colors.yellow.shade900]),
  ColorPickerWidgetModel(
      canEdit: true,
      label: "Background Color",
      action: Constants.nullValue,
      width: 30.0,
      height: 30.0,
      name: Constants.nullValue,
      colorCode: [Colors.transparent])
];
List<ColorPickerWidgetModel> audioVisualGradientList = [
  ColorPickerWidgetModel(
      canEdit: true,
      label: Constants.nullValue,
      action: Constants.edit,
      name: Constants.nullValue,
      colorCode: [
        Colors.red.shade900,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.red
      ])
];

//// color picker provider class to handle the color picker generate ui functions, and set the current color
class ColorPickerProvider extends ChangeNotifier {
  ColorPickerWidgetModel currentColor =
      ColorPickerWidgetModel(name: Constants.nullValue, colorCode: []);
  List<Color> currentColors = [];
  Color colors = Colors.transparent;
  List<bool> hasBorder = [];
  Timer? timer;
  Color color = Colors.transparent;
  int position = 0;

  ColorGradientEnum gradientType = ColorGradientEnum.linear;

  /// current color
  List<Color> lastColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent
  ];

  ///  last color selected colors
  /// preset colors for differnet color modes
  List<List<Color>> presetColors = [
    [
      Colors.red,
      Colors.orange.shade700,
      Colors.orange,
      Colors.yellow.shade700,
      Colors.yellow,
      Colors.yellow.shade200,
      Colors.green.shade700,
      Colors.green,
      Colors.green.shade200
    ],
    [
      Colors.white,
      Colors.pink.shade700,
      Colors.pink,
      Colors.purple,
      Colors.purple.shade700,
      Colors.indigo.shade700,
      Colors.blue.shade900,
      Colors.blue.shade200,
      Colors.green.shade100
    ]
  ];

  // function to set the current color and notify the provider listener
  void setCurrentPickerWidget(ColorPickerWidgetModel data) {
    currentColor = data;
    notifyListeners();
  }

  void choooseGradientType(ColorGradientEnum choice) {
    gradientType = choice;
    notifyListeners();
  }

  // function to generate the color picker widget based on the various picker model been passed as an argument
  List<Widget> generateColorPickerWidget(
      List<ColorPickerWidgetModel> list, BuildContext context) {
    List<Widget> generatedUI = [];
    for (ColorPickerWidgetModel element in list) {
      /// loop through the color pickermodel list
      generatedUI.add(ColorPickerWidget(

          /// add new model to the list in based on values anargument been passed
          color: element.colorCode.first,

          /// get the first element color of the colorcode list been used
          colors: element.colorCode,
          context: context,
          title: element.name,
          width: element.width,
          height: element.height,
          label: element.label,
          hasBorder: element.hasBorder,
          leftTitle: element.action!,
          onchange: (colors) {
            colorChange(colors, context);
          },
          setRandom: element.setRandom,
          picker: element.canEdit));
    }

    /// return the list of generate color picker model
    return generatedUI;
  }

  colorChange(List<Color> colors, BuildContext context) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    modeProvider.setCurrentMode(ToolsModeModel(
        currentColor: currentColor.colorCode,
        value: modeProvider.currentMode.value,
        effects: modeProvider.currentMode.effects,
        icon: modeProvider.currentMode.icon,
        name: modeProvider.currentMode.name));
    layerProvider.toolsEffectsUpdated();
  }

  /// function to generate random colors
  Color generateRandomColor() {
    return Color(0xffffffff & Random().nextInt(0xffffffff));
  }
}
