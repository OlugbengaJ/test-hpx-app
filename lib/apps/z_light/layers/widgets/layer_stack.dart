import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_colored_item.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';

class LayersStack extends StatefulWidget {
  const LayersStack({Key? key, required this.layers}) : super(key: key);
  final List<LayerStackItem> layers;

  @override
  State<LayersStack> createState() => _LayersStackState();
}

class _LayersStackState extends State<LayersStack> {
  _getStackColoredLayers(provider) {
    List<Widget> layers = [];
    provider.stackedLayeritems.forEach(
        (layer) => {layers.add(LayerStackColoredItem(layerItemModel: layer))});

    return layers;
  }

  _getStackedLayers(provider) {
    List<Widget> layers = [];
    provider.stackedLayeritems.forEach(
        (layer) => {layers.add(LayerStackItem(layerItemModel: layer))});

    return layers;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, value, child) {
        return (value.hideStackedLayers)
            ? Container()
            : Stack(
                children: _getStackColoredLayers(value) +
                    [
                      IndexedStack(
                        index: value.index,
                        children: _getStackedLayers(value),
                      ),
                    ],
              );
      },
    );
  }
}
