import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class Layers extends StatefulWidget {
  const Layers({Key? key, required this.layers, required this.onReorder})
      : super(key: key);
  final Function(int oldIndex, int newIndex) onReorder;
  final List<LayerListItem> layers;

  @override
  State<Layers> createState() => _LayersState();
}

class _LayersState extends State<Layers> {
  final areaHeight = Get.height * 0.70;
  final areaWidth = Get.width * 0.70;    
  
  _addLayer(provider) {
    provider.add(
      LayerItemModel(
        id: provider.lenght + 1,
        layerText: 'New layer Value ' + (provider.lenght + 1).toString(),
        controller: ResizableWidgetController(
          initialPosition: Offset(areaWidth / 2, areaHeight / 2),
          areaHeight: areaHeight,
          areaWidth: areaWidth,
          height: areaHeight / 2,
          width: areaWidth / 2,
          minWidth: 50,
          minHeight: 50,
        )
      )        
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 20.0, bottom: 10.0),
          child: Text(
            "Layers",
            style: h4Style,
          ),
        ),
        Consumer<LayersProvider>(
          builder: (context, provider, child) {
            return InkWell(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "Create New Layer",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              onTap: () => _addLayer(provider),
            );
          },
        ),
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(1),
              color: Colors.black12,
              height: MediaQuery.of(context).size.height,
              child: Consumer<LayersProvider>(
                builder: (context, value, child) {
                  return ReorderableListView.builder(
                    buildDefaultDragHandles: true,
                    padding: const EdgeInsets.all(2),
                    itemCount: value.lenght,
                    scrollController: ScrollController(keepScrollOffset: false),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        key: Key("$index"),
                        child: LayerListItem(
                          layerID: index,
                          layerItemModel: value.getItem(index),
                        ),
                      );
                    },
                    onReorder: value.reorder,
                  );
                },
              )),
        )
      ],
    );
  }
}
