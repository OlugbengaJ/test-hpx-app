import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/stateful_resizable.dart';
import 'package:hpx/providers/layers.dart';
import 'package:provider/provider.dart';

import '../../../../models/layers/layer_item_model.dart';

class LayerStackItem extends StatefulWidget {
  const LayerStackItem({ Key? key, required this.layerID, required this.layerItemModel  }) : super(key: key);
  final int layerID;
  final LayerItemModel layerItemModel;

  @override
  State<LayerStackItem> createState() => _LayerStackItemState();
}

class _LayerStackItemState extends State<LayerStackItem> {
  double dragWidgetSize = 50;

  @override
  Widget build(BuildContext context) {
    return  Consumer<LayersProvider>(
      builder: (context, _value, child){
        return
        Container(
          color: Colors.transparent,
            child: 
            StatefulResizableWidget(
              dragWidgetHeight: dragWidgetSize,
              dragWidgetWidth: dragWidgetSize,
              controller: widget.layerItemModel.controller,
              dragWidget: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (widget.layerItemModel.visible)? Colors.white: Colors.transparent,
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
                    color: (widget.layerItemModel.visible)? Colors.white: Colors.transparent,
                  ),
                ),
              ),
            ),
          );
        }
    );    
  }
}