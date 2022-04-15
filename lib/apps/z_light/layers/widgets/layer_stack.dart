import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';

class LayersStack extends StatefulWidget {
  const LayersStack({ Key? key, required this.layers, required this.currentIndex }) : super(key: key);
  final List<LayerStackItem> layers;
  final int currentIndex;

  @override
  State<LayersStack> createState() => _LayersStackState();
}

class _LayersStackState extends State<LayersStack> {
  @override
  Widget build(BuildContext context) {
   
    return IndexedStack(
      children: widget.layers,
    );
  }
}