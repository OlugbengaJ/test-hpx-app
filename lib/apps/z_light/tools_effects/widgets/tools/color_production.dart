import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';

class ColorProductionPreset extends StatefulWidget {
  const ColorProductionPreset({Key? key}) : super(key: key);

  @override
  State<ColorProductionPreset> createState() => _ColorProductionPresetState();
}

class _ColorProductionPresetState extends State<ColorProductionPreset> {
  final _toolsProvider = ColorPickerProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20.0),
        child: Wrap(
          children: _toolsProvider.generateColorPickerWidget(
              colorProductionList, context),
        ));
  }
}
