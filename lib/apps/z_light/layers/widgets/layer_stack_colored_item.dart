import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/colored_resizable.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/keyboard/keys_provider.dart';
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

  List<Widget> _widgetPaints() {
    List<Widget> zones = [];
    for (var item in widget.layerItemModel.controller.zoneToPaint) {
      if (widget.layerItemModel.visibleOnStack) {
        zones.add(
          Positioned(
            top: item['position'].dy,
            left: item['position'].dx,
            child: Opacity(
              opacity: 1,
              child: Container(
                height: item['size'].height,
                width: item['size'].width,
                color: widget.layerItemModel.paintColor,
              ),
            ),
          ),
        );
      }
    }
    return zones;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _widgetPaints() +
          [
            Consumer<LayersProvider>(builder: (context, _value, child) {
              return Container(
                color: Colors.transparent,
                child: ColoredResizable(
                  keysToWatch: context.watch<KeySelectorProvider>().keysTowatch,
                  dragWidgetHeight: dragWidgetSize,
                  dragWidgetWidth: dragWidgetSize,
                  controller: widget.layerItemModel.controller,
                  dragWidget: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
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
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
    );
  }
}
