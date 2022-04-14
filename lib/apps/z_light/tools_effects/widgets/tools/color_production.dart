import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/color_picker.dart';
import 'package:hpx/widgets/theme.dart';

class ColorProductionPreset extends StatefulWidget {
  @override
  State<ColorProductionPreset> createState() => _ColorProductionPresetState();
}

class _ColorProductionPresetState extends State<ColorProductionPreset> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
      child: Color_Picker(
          title: 'Netural (D65 White Point)', color: Colors.yellow),
    );
  }
}
