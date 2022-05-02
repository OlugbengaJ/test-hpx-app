import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/colored_resizable.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';

class LayerStackColoredItem extends StatefulWidget {
  const LayerStackColoredItem({Key? key, required this.layerItemModel})
      : super(key: key);
  final LayerItemModel layerItemModel;

  @override
  State<LayerStackColoredItem> createState() => _LayerStackColoredItemState();
}

class _LayerStackColoredItemState extends State<LayerStackColoredItem> {
  double dragWidgetSize = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(builder: (context, _value, child) {
      return Container(
        color: Colors.transparent,
        child: ColoredResizable(
          dragWidgetHeight: dragWidgetSize,
          dragWidgetWidth: dragWidgetSize,
          controller: widget.layerItemModel.controller,
          dragWidget: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (widget.layerItemModel.visible)
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: (widget.layerItemModel.visible)
                    ? Colors.white
                    : Colors.transparent,
              ),
            ),
          ),
        ),
      );
    });
  }
}
