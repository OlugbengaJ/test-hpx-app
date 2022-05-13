import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/layers/layers.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/layouts/three_columns.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<LayerListItem> _layersListItems = [];
  final List<LayerStackItem> _layersStackItems = [];
  final _modeProvider = ModeProvider();

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
      log(["layerIndex:", item.layerIndex.toString(), ':New Index:', newIndex]
          .toString());
      _layersListItems.insert(newIndex, item);
      log(_layersListItems[newIndex].layerIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final workspaceProvider = Provider.of<WorkspaceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  primary: workspaceProvider.isWorkspaceView
                      ? Colors.white
                      : Colors.grey,
                  backgroundColor: Colors.transparent,
                  textStyle: h4Style),
              child: const Text('Workspace'),
              onPressed: () {
                workspaceProvider.toggleView(WorkspaceView.workspace);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  primary: workspaceProvider.isLightingView
                      ? Colors.white
                      : Colors.grey,
                  backgroundColor: Colors.transparent,
                  textStyle: h4Style),
              child: const Text('Lighting Options'),
              onPressed: () {
                workspaceProvider.toggleView(WorkspaceView.lighting);
              },
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 20, right: 20),
            child: Text(
              "Selected Profile",
              textAlign: TextAlign.left,
              style: h5Style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _modeProvider.getPickerModes('profile').first,
                  menuMaxHeight: 400,
                  alignment: Alignment.bottomRight,
                  hint: Text(
                    'Select profile...',
                    style: pStyle,
                  ),
                  underline: const SizedBox(),
                  items: _modeProvider
                      .getPickerModes('profile')
                      .map((e) => DropdownMenuItem(
                            enabled: e.enabled,
                            value: e,
                            child: GetProfileList(profile: e),
                          ))
                      .toList(),
                  onChanged: (o) {},
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ThreeColumns(
          leftChild: Layers(onReorder: _updateLayers, layers: _layersListItems),
          centerChild: Stack(
            children: [
              Workspace(
                layers: _layersStackItems,
              ),
            ],
          ),
          rightChild: const ToolsEffectsWrapper(),
        ),
      ),
    );
  }
}

// TODO: Profile should be removed from mode provider into a Profile Provider
// TODO: delete; added here just for test and must be refactored properly.
class GetProfileList extends StatelessWidget {
  const GetProfileList({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final PickerModel profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (profile.enabled) Icon(profile.icon, size: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            profile.title,
            style: pStyle,
          ),
        ),
      ],
    );
  }
}
