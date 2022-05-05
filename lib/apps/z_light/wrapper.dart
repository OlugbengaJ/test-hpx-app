import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/app_enum.dart';
import 'package:hpx/apps/z_light/layers/layers.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:hpx/providers/keyboard/keys_provider.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/components/zone_selector/zone_selector.dart';
import 'package:hpx/widgets/components/zone_selector/zone_selector_provider.dart';
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
  WORKSPACE_VIEW currentView = WORKSPACE_VIEW.workspace;
  final _modeProvider = ModeProvider();
  final PickerModel _defaultPreset = PickerModel(
      title: 'Default', enabled: true, value: 'default', icon: Icons.dashboard);

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

  _changeView(WORKSPACE_VIEW view) {
    context.read<KeySelectorProvider>().clearKeys();
    // context.read<ZoneSelectorProvider>().updatePosition();
  }

  void _getSize(Size size) {}

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
                workspaceProvider.toggleView(WORKSPACE_VIEW.workspace);
                _changeView(WORKSPACE_VIEW.workspace);
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
                workspaceProvider.toggleView(WORKSPACE_VIEW.lighting);
                _changeView(WORKSPACE_VIEW.lighting);
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2, right: 30),
                child: SizedBox(
                  width: 300,
                  child: PickerDropdown(
                    onChange: (PickerModel? returnValue) {
                      setState(() {});
                    },
                    defaultPicker: _defaultPreset,
                    pickerHintText: "Select a Profile ...",
                    pickerList: _modeProvider.getPickerModes('profile'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ThreeColumns(
          leftChild: Layers(onReorder: _updateLayers, layers: _layersListItems),
          centerChild: Stack(children: [
            Workspace(
              layers: _layersStackItems,
            ),
            Consumer<KeySelectorProvider>(builder: (_, provider, child) {
              return provider.keySelectorDisplayed
                  ? ZoneSelector(
                      getSize: _getSize,
                      widgetsKeys: provider.keysTowatch,
                    )
                  : Container();
            }),
          ]),
          rightChild: const ToolsEffectsWrapper(),
        ),
      ),
    );
  }
}
