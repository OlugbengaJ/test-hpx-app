import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/widgets/layouts/three_columns.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);

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
                            primary: (!workspaceProvider.showLighting)
                                ? Colors.white
                                : Colors.grey,
                            backgroundColor: Colors.transparent,
                            textStyle: h3Style),
                        child: const Text('Workspace'),
                        onPressed: () {
                          workspaceProvider.toggleView(WorkspaceView.workspace);
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
                          primary: (workspaceProvider.showLighting)
                              ? Colors.white
                              : Colors.grey,
                          backgroundColor: Colors.transparent,
                          textStyle: h3Style),
                      child: const Text('Lighting Options'),
                      onPressed: () {
                        workspaceProvider.toggleView(WorkspaceView.lighting);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ThreeColumns(
          leftWidget:
              Layers(onReorder: _updateLayers, layers: _layersListItems),
          centerWidget: Workspace(
            layers: _layersStackItems,
          ),
          rightWidget: const ToolsEffectsWrapper(),
        ),
      ),
    );
  }
}
