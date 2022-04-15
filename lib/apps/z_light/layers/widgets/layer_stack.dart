import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:provider/provider.dart';
import 'package:hpx/providers/layers.dart';

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
    return Consumer<LayersProvider>(
      builder: (context, value, child){
        return IndexedStack(
          children: widget.layers,
        );
      },
    );
  }
}