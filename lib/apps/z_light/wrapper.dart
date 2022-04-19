import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/widgets/layouts/three_columns.dart';
import 'package:hpx/widgets/theme.dart';

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
  final int _nextIndex = 0;
  final int _currentIndex = 0;
  String currentView = "workspace";

  @override
  void initState() {
    super.initState();
  }

  _updateLayers(int oldIndex, int newIndex) {
    log([
      "old:",
      oldIndex,
      ":new:",
      newIndex,
      ":length:",
      _layersListItems.length
    ].toString());
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _layersListItems.removeAt(oldIndex);
      log(["layerID:", item.layerID.toString(), ':New Index:', newIndex]
          .toString());
      _layersListItems.insert(newIndex, item);
      log(_layersListItems[newIndex].layerID.toString());
    });
  }

  _changeView() {
    setState(() {
      currentView = (currentView == "workspace") ? "lighting" : 'workspace';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("Z Light Space"),
        title: SizedBox(
          width: 400,
          child: Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            primary: (currentView == "workspace")
                                ? Colors.white
                                : Colors.grey,
                            backgroundColor: Colors.transparent,
                            textStyle: h3Style),
                        child: const Text('Workspace'),
                        onPressed: () {
                          _changeView();
                        },
                      ),
                    ]),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            primary: (currentView != "workspace")
                                ? Colors.white
                                : Colors.grey,
                            backgroundColor: Colors.transparent,
                            textStyle: h3Style),
                        child: const Text('Lighting Options'),
                        onPressed: () {
                          _changeView();
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: (currentView == "workspace")
              ? Workspace(
                  currentIndex: _currentIndex, // For hide and show
                  layers: _layersStackItems,
                )
              : ThreeColumns(
                  left: Layers(
                      onReorder: _updateLayers, layers: _layersListItems),
                  center: Workspace(
                    currentIndex: _currentIndex, // For hide and show
                    layers: _layersStackItems,
                  ),
                  right: const ToolsEffectsWrapper(),
                )),
    );
  }
}
