import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/color_preset.dart';

class Tools_Effects_Wrapper extends StatefulWidget {
  const Tools_Effects_Wrapper({Key? key}) : super(key: key);

  @override
  State<Tools_Effects_Wrapper> createState() => _Tools_Effects_WrapperState();
}

class _Tools_Effects_WrapperState extends State<Tools_Effects_Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Color_Preset(),
      ),
    );
  }
}
