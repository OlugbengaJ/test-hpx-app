import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/shortcut_widget_provider.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ShortcutColorsPreset extends StatefulWidget {
  const ShortcutColorsPreset({Key? key}) : super(key: key);

  @override
  State<ShortcutColorsPreset> createState() => _ShortcutColorsPresetState();
}

class _ShortcutColorsPresetState extends State<ShortcutColorsPreset> {
  String activatedButton = "Custom";
  LayerItemModel? subLayer;

  activationDialog() {}

  Widget presetSubLayer() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade900),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Command', textAlign: TextAlign.left, style: labelStyle),
                ],
              ),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Key', textAlign: TextAlign.left, style: labelStyle),
                ],
              ),
            ))
          ]),
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              margin: const EdgeInsets.only(top: 5, left: 0, right: 10),
              child: Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Contact Support',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "GoogleSans")),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('FN + F12',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "GoogleSans")),
                  ],
                ))
              ]))
        ],
      ),
    );
  }

  Widget processSubLayer() {
    ShortcutWidgetProvider shortcutProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade900),
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Command',
                          textAlign: TextAlign.left, style: labelStyle),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Key', textAlign: TextAlign.left, style: labelStyle),
                    ],
                  ),
                ))
              ]),
              ...Provider.of<KeysProvider>(context)
                  // .getShortcutKeys(
                  //     layerProvider.getCurrentSublayer()!.id.toString())!
                  .getAllShortcutKeys
                  .map(
                    (e) => ChangeNotifierProvider.value(
                        value: e,
                        builder: (context, child) => shortcutProvider
                            .addNewCommand(e.keyCode.toString())),
                  )
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            activationDialog();
          },
          style: textBtnStyleWhite,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add Shortcut',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget generateCustomWidget() {
    ShortcutWidgetProvider shortcutProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Shortcut Group", textAlign: TextAlign.left, style: h5Style),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              activatedButton = "Custom";
                            });
                          },
                          style: (activatedButton != 'Custom')
                              ? textBtnStyleBlack
                              : textBtnStyleWhite,
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'CUSTOM',
                                    style: TextStyle(
                                        color: (activatedButton != 'Custom')
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              activatedButton = "Themes";
                            });
                          },
                          style: (activatedButton == 'Custom')
                              ? textBtnStyleBlack
                              : textBtnStyleWhite,
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'THEMES',
                                    style: TextStyle(
                                        color: (activatedButton == 'Custom')
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            child: ColorPickerWidget(
              color: (subLayer != null)
                  ? subLayer!.shortcutColor
                  : shortcutList[0].colorCode.first,
              colors: shortcutList[0].colorCode,
              title: (subLayer != null)
                  ? subLayer!.layerText
                  : shortcutList[0].name,
              label: shortcutList[0].label,
              picker: shortcutList[0].canEdit,
              leftTitle: shortcutList[0].action!,
              onchange: (colors) {
                setState(() {
                  // subLayer = layerProvider.getCurrentSublayer();
                  subLayer?.shortcutColor = colors.first;
                });
              },
            ),
          ),
          (activatedButton == 'Custom') ? processSubLayer() : presetSubLayer()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    ShortcutWidgetProvider shortcutProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    subLayer = shortcutProvider.getSubLayerInfo();

    return (modeProvider.currentMode.modeType == EnumModeType.layers)
        ? Container()
        : generateCustomWidget();
  }
}
