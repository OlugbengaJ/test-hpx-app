import 'package:flutter/material.dart';
import 'package:hpx/providers/tools_effect_provider/color_picker_provider.dart';

class ColorProductionPreset extends StatelessWidget {
  ColorProductionPreset({Key? key}) : super(key: key);

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
