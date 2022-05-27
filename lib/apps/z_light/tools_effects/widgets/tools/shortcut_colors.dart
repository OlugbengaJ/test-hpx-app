import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/providers/tools_effect_provider/widget/shortcut_widget_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class ShortcutColorsPreset extends StatefulWidget {
  const ShortcutColorsPreset({Key? key}) : super(key: key);

  @override
  State<ShortcutColorsPreset> createState() => _ShortcutColorsPresetState();
}

class _ShortcutColorsPresetState extends State<ShortcutColorsPreset> {
  @override
  Widget build(BuildContext context) {
    ModeProvider modeProvider =
        Provider.of<ModeProvider>(context, listen: false);
    ShortcutWidgetProvider shortcutProvider =
        Provider.of<ShortcutWidgetProvider>(context, listen: false);
    ColorPickerProvider colorPickerProvider =
        Provider.of<ColorPickerProvider>(context, listen: false);
    
    return (modeProvider.currentMode.modeType == EnumModeType.layers)
        ? Container()
        : Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Shortcut Group",
                    textAlign: TextAlign.left, style: h5Style),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Wrap(
                      children: colorPickerProvider
                          .generateColorPickerWidget(shortcutList)),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade900),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Command',
                                textAlign: TextAlign.left, style: labelStyle),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Key',
                                textAlign: TextAlign.left, style: labelStyle),
                          ],
                        ))
                      ]),
                      Wrap(children: shortcutProvider.commandsList)
                    ],
                  ),
                ),
                FlatButton(
                  textColor: Colors.black,
                  height: 30.0,
                  color: Colors.white,
                  child: const Text('Add Shortcut'),
                  onPressed: () {
                    setState(() {
                      shortcutProvider.addNewCommand('');
                      // /// initialize the layers provider to use to send notification accross the layers
                      LayersProvider layerProvider =
                          Provider.of<LayersProvider>(context, listen: false);
                      layerProvider.toolsEffectsUpdated();

                    });
                  },
                )
              ],
            ),
          );
  }
}
