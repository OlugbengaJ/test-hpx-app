import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/widgets/theme.dart';

class Layers extends StatefulWidget {
  const Layers({ Key? key }) : super(key: key);

  @override
  State<Layers> createState() => _LayersState();
}

class _LayersState extends State<Layers> {
  final List<Widget> _layers = [];
  @override
  void initState() {
    super.initState();
    _addLayer(); // Default layer
  }

  _deleteLayer(){
    // Delete all layers but one.
    if(_layers.length>1){
      print("Delete item");
    }    
  }
  
  _addLayer(){
    // Add layer to the layers list
    setState(() {
      _layers.add(
        LayerListItem(
          deleteItem: _deleteLayer,
        )
      );
    });
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
            style: h3Style,
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
          onTap: _addLayer,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(1),
            color: Colors.black12,
            height: MediaQuery.of(context).size.height,
            child: ReorderableListView.builder(
              padding: const EdgeInsets.all(2),
              itemCount: _layers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  key: Key("$index"),
                  child: _layers[index],
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