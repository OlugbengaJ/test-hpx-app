import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/widgets/modes.dart';

class ToolsEffectsWrapper extends StatefulWidget {
  const ToolsEffectsWrapper({Key? key}) : super(key: key);

  @override
  State<ToolsEffectsWrapper> createState() => _ToolsEffectsWrapperState();
}

class _ToolsEffectsWrapperState extends State<ToolsEffectsWrapper> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ToolModes()],
    );
  }
}
