import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';

import '../layers/widgets/layer_stack_item.dart';

class Workspace extends StatefulWidget {
  const Workspace({ Key? key, required this.layers, required this.currentIndex }) : super(key: key);
  final List<LayerStackItem> layers;
  final int currentIndex;

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {

  @override
  Widget build(BuildContext context) {
    return LayersStack(
      layers: widget.layers,
      currentIndex: widget.currentIndex,
    );
  }
}