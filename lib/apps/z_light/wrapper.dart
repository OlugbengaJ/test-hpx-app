import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/widgets/layouts/three_columns.dart';

import 'layers/layers.dart';
import 'layers/widgets/layer_list_item.dart';
import 'layers/widgets/layer_stack_item.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<LayerListItem> _layersListItems = [];
  final List<LayerStackItem> _layersStackItems = [];
  int _nextIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _addLayer();
  }

  _addLayer() {
    // Add layer to the layers list
    setState(() {
      _layersListItems.add(LayerListItem(
        layerID: _nextIndex,
        deleteItem: _deleteLayer,
        toggleItem: _toggleLayer,
      ));
      _layersStackItems.add(LayerStackItem(
        layerID: _nextIndex,
      ));
      _currentIndex = _layersStackItems.length - 1;
      _nextIndex += 1;
    });
  }

  _deleteLayer(layerID) {
    setState(() {
      _layersListItems.removeWhere((item) => item.layerID == layerID);
      _layersStackItems.removeWhere((item) => item.layerID == layerID);
      if (_layersStackItems.isNotEmpty) {
        _currentIndex = _layersStackItems.length - 1;
      }
    });
  }

  _toggleLayer(layerID, bool show) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ThreeColumns(
        left: Layers(addLayer: _addLayer, layers: _layersListItems),
        center: Workspace(
          currentIndex: _currentIndex, // For hide and show
          layers: _layersStackItems,
        ),
        right: const ToolsEffectsWrapper(),
      )),
    );
  }
}
