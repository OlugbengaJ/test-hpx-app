import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/modes.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/preset.dart';

class toolsEffectsWrapper extends StatefulWidget {
  const toolsEffectsWrapper({Key? key}) : super(key: key);

  @override
  State<toolsEffectsWrapper> createState() => _toolsEffectsWrapperState();
}

class _toolsEffectsWrapperState extends State<toolsEffectsWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [toolModes(), colorsPreset()]),
      ),
    );
  }
}
