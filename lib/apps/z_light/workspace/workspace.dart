import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';

import '../layers/widgets/layer_stack_item.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key, required this.layers, required this.currentIndex})
      : super(key: key);
  final List<LayerStackItem> layers;
  final int currentIndex;

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayersStack(
        layers: widget.layers,
        currentIndex: widget.currentIndex,
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backdrop.png"),
              repeat: ImageRepeat.repeat)),
    );
  }
}
