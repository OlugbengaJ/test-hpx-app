import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/colored_resizable.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
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
  final areaHeight = Get.height * 0.70;
  final areaWidth = Get.width * 0.70;

  final controller = Get.put(
    ResizableWidgetController(
      initialPosition: Offset(areaWidth / 2, areaHeight / 2),
      minWidth: 50,
      minHeight: 50,
    ),
  );

  List<Widget> _widgetPaints() {
    List<Widget> zones = [];
    for (var item in []) {
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
            Consumer<LayersProvider>(builder: (context, provider, child) {
              return Container(
                color: Colors.transparent,
                child: ColoredResizable(
                  keysToWatch: [],
                  dragWidgetHeight: dragWidgetSize,
                  dragWidgetWidth: dragWidgetSize,
                  controller: provider.getController(widget.layerItemModel.id),
                  dragWidget: Container(
                    height: 5,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
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
                        color: Colors.white,
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
