import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class Layers extends StatefulWidget {
  const Layers(
      {Key? key,
      required this.layers,
      required this.onReorder})
      : super(key: key);
  final Function(int oldIndex, int newIndex) onReorder;
  final List<LayerListItem> layers;

  @override
  State<Layers> createState() => _LayersState();
}

class _LayersState extends State<Layers> {

  _addLayer(provider) {
    provider.add(
      LayerItemModel(
        id: provider.lenght + 1,
        layerText:  'New layer Value ' + (provider.lenght + 1).toString()
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
          margin: const EdgeInsets.all(8),
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
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        key: Key("$index"),
                        child: LayerListItem(
                          layerID: index,
                          layerItemModel: value.getItem(index),
                          toggleItem: () {}
                        ),
                      );
                    },
                    // onReorder: (int oldIndex, int newIndex) {},
                    onReorder: value.reorder,
                  );
                },
              )),
        )
      ],
    );
  }
}
