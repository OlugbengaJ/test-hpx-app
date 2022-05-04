import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/common.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:ionicons/ionicons.dart';
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
    int id = 1; // For first element;
    if (provider.layeritems.isNotEmpty) {
      provider.layeritems.forEach((element) {
        if (element.id > id) {
          id = element.id;
        }
      });
      id = id + 1;
    }
    provider.add(LayerItemModel(
        id: id,
        layerText: 'New layer Value ' + id.toString(),
        controller: ResizableWidgetController(
          initialPosition: Offset(areaWidth / 2, areaHeight / 2),
          areaHeight: areaHeight,
          areaWidth: areaWidth,
          height: areaHeight / 2,
          width: areaWidth / 2,
          minWidth: 50,
          minHeight: 50,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(builder: (context, provider, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.zero,
            child: Text("Layers", style: h5Style),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Tooltip(
              message: "Add a new Layer",
              child: TextButton(
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Ionicons.add),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Create New Layer",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () => _addLayer(provider),
                style: textBtnStyleWhite,
              ),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                color: Colors.black12,
                height: screenDimension(context).height,
                child: ReorderableListView.builder(
                  buildDefaultDragHandles: true,
                  padding: const EdgeInsets.all(2),
                  itemCount: provider.length,
                  scrollController: ScrollController(keepScrollOffset: false),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      key: Key("$index"),
                      child: LayerListItem(
                        layerIndex: index,
                        layerItemModel: provider.getItem(index),
                      ),
                    );
                  },
                  onReorder: provider.reorder,
                )),
          )
        ],
      );
    });
  }
}
