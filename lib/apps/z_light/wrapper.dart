import 'package:flutter/material.dart';
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
          center: Center(child: Text("Workspace")),
          right: Center(child: Text("Tools effect")),
        )
      ),
    );
  }
}
