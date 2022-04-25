import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/color_picker.dart';

class ColorProductionPreset extends StatefulWidget {
  const ColorProductionPreset({Key? key}) : super(key: key);

  @override
  State<ColorProductionPreset> createState() => _ColorProductionPresetState();
}

class _ColorProductionPresetState extends State<ColorProductionPreset> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Color_Picker(
          leftTitle: '',
          title: 'Netural (D65 White Point)',
          color: Colors.yellow),
    );
  }
}
