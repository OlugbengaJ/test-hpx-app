import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/widgets/theme.dart';

class Layers extends StatefulWidget {
  const Layers({ Key? key, required this.addLayer, required this.layers }) : super(key: key);
  final Function addLayer;
  final List<LayerListItem> layers;

  @override
  State<Layers> createState() => _LayersState();
}

class _LayersState extends State<Layers> {  

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
        InkWell(
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
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            widget.addLayer();
          },
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(1),
            color: Colors.black12,
            height: MediaQuery.of(context).size.height,
            child: ReorderableListView.builder(
              buildDefaultDragHandles: true,
              padding: const EdgeInsets.all(2),
              itemCount: widget.layers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  key: Key("$index"),
                  child: widget.layers[index],
                );
              }, onReorder: (int oldIndex, int newIndex) {

              },
            )
          ),
        )
      ],
    );
  }
}