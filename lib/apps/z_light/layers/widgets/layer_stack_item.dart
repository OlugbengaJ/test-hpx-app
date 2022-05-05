import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/stateful_resizable.dart';
import 'package:hpx/providers/apps/zlightspace_providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';

import '../../../../models/layers/layer_item_model.dart';
import '../../../../providers/apps/zlightspace_providers/keyboard/keys_provider.dart';

class LayerStackItem extends StatefulWidget {
  const LayerStackItem(
      {Key? key, required this.layerItemModel})
      : super(key: key);
  final LayerItemModel layerItemModel;

  @override
  State<LayerStackItem> createState() => _LayerStackItemState();
}

class _LayerStackItemState extends State<LayerStackItem> {
  double dragWidgetSize = 50;

  
  


  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(builder: (context, _value, child) {
      return Visibility(
        visible: widget.layerItemModel.visibleOnStack,
        child: Container(
          color: Colors.transparent,
          child: StatefulResizableWidget(
            dragWidgetHeight: dragWidgetSize,
            dragWidgetWidth: dragWidgetSize,
            controller: widget.layerItemModel.controller,
            keysToWatch: context.watch<KeysProvider>().keysTowatch,
            dragWidget: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:  Colors.white
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
