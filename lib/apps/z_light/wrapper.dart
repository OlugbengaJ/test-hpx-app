import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/widgets/layouts/three_columns.dart';

import 'layers/layers.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ThreeColumns(
        left: Layers(),
        center: Workspace(
          
        ),
        right: Center(child: Tools_Effects_Wrapper()),
      )),
    );
  }
}
