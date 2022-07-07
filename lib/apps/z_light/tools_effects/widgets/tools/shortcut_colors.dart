import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';
import 'package:hpx/providers/keys_provider.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
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

  List<Widget> generatePreset() {
    LayersProvider layerProvider =
        Provider.of<LayersProvider>(context, listen: false);
    KeysProvider keysProvider =
        Provider.of<KeysProvider>(context, listen: false);
    var presets = layerProvider.getPresetKeys();
    subLayer = Provider.of<LayersProvider>(context).getCurrentSublayer();
    List<Widget> ui = [];
    for (var element in presets) {
      String name = element['name'];
      String keys = element['keys'].first + ' + ' + element['keys'].last;
      ui.add(InkWell(
        onTap: () {
          switch (element['name']) {
            case "Copy":
              var key = keysProvider.getKey(KeyCode.kCtrlLeft);
              keysProvider.addShortcutKey(subLayer!.id.toString(), key);
              // Provider.of<KeysProvider>(context).addShortcutKey(
              //     subLayer!.id.toString(),
              //     Provider.of<KeysProvider>(context).getKey(KeyCode.kV));
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade800),
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
          margin: const EdgeInsets.only(top: 5, left: 0, right: 10),
          child: Row(children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, textAlign: TextAlign.left, style: labelStyle),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(keys, textAlign: TextAlign.left, style: labelStyle),
              ],
            ))
          ]),
        ),
      ));
    }
    return ui;
  }

  Widget presetSubLayer() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade900),
      margin: const EdgeInsets.only(top: 20),
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
          Wrap(children: generatePreset())
        ],
      ),
    );
  }

  Widget processSubLayer() {
    ShortcutWidgetProvider shortcutProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    subLayer = Provider.of<LayersProvider>(context).getCurrentSublayer();
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 20),
          child: ColorPickerWidget(
            color: subLayer != null
                ? subLayer!.shortcutColor
                : shortcutList[0].colorCode.first,
            colors: shortcutList[0].colorCode,
            title:
                subLayer != null ? subLayer!.layerText : shortcutList[0].name,
            label: shortcutList[0].label,
            picker: shortcutList[0].canEdit,
            leftTitle: shortcutList[0].action!,
            onchange: (colors) {
              setState(() {
                subLayer?.shortcutColor = colors.first;
              });
            },
          ),
        ),
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
                  .getShortcutKeys(subLayer!.id.toString())!
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
          // Container(
          //   margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: [
          //               TextButton(
          //                 onPressed: () {
          //                   setState(() {
          //                     activatedButton = "Custom";
          //                   });
          //                 },
          //                 style: (activatedButton != 'Custom')
          //                     ? textBtnStyleBlack
          //                     : textBtnStyleWhite,
          //                 child: SizedBox(
          //                   height: 40,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Text(
          //                           'CUSTOM',
          //                           style: TextStyle(
          //                               color: (activatedButton != 'Custom')
          //                                   ? Colors.white
          //                                   : Colors.black),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ]),
          //       ),
          //       Expanded(
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: [
          //               TextButton(
          //                 onPressed: () {
          //                   setState(() {
          //                     activatedButton = "Preset";
          //                   });
          //                 },
          //                 style: (activatedButton == 'Custom')
          //                     ? textBtnStyleBlack
          //                     : textBtnStyleWhite,
          //                 child: SizedBox(
          //                   height: 40,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Text(
          //                           'PRESETS',
          //                           style: TextStyle(
          //                               color: (activatedButton == 'Custom')
          //                                   ? Colors.white
          //                                   : Colors.black),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ]),
          //       ),
          //     ],
          //   ),
          // ),
          (activatedButton == 'Custom') ? processSubLayer() : presetSubLayer()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<LayersProvider>(context).isSublayerSelected == false)
        ? Container()
        : generateCustomWidget();
  }
}
