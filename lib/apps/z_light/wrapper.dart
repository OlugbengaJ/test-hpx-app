import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/tools_effects/tools_effects_wrapper.dart';
import 'package:hpx/apps/z_light/workspace/workspace.dart';
import 'package:hpx/providers/apps/zlightspace_providers/keyboard/keys_provider.dart';
import 'package:hpx/providers/apps/zlightspace_providers/layers_provider/layers.dart';
import 'package:hpx/providers/apps/zlightspace_providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:hpx/widgets/components/zone_selector/zone_selector.dart';
import 'package:hpx/widgets/components/zone_selector/zone_selector_provider.dart';
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
  final int _currentIndex = 0;
  String currentView = "workspace";
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

  _changeView(value) {
    setState(() {
      currentView = value;
    });

    context.read<KeysProvider>().clearKeys();
    context.read<ZoneSelectorProvider>().updatePosition();

    if (currentView == "lighting") {
      context.read<LayersProvider>().toggleHideStackedLayers(false);
    } else {
      context.read<LayersProvider>().toggleHideStackedLayers(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            children: [
              SizedBox(
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
                                  textStyle: h4Style),
                              child: const Text('Workspace'),
                              onPressed: () {
                                _changeView("workspace");
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
                                  textStyle: h4Style),
                              child: const Text('Lighting Options'),
                              onPressed: () {
                                _changeView("lighting");
                              },
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              child: Text("Selected Profile : ",
                  textAlign: TextAlign.left, style: h4Style),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2, right: 30),
                  child: SizedBox(
                    width: 300,
                    child: PickerDropdown(
                        onChange: (PickerModel? returnValue) {
                          setState(() {});
                        },
                        defaultPicker: _defaultPreset,
                        pickerHintText: "Select a Profile ...",
                        pickerList: _modeProvider.getPickerModes('profile')),
                  ),
                ),
              ],
            ),
          ],
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
                    center: Stack(
                      children: [
                        Workspace(
                          currentIndex: _currentIndex, // For hide and show
                          layers: _layersStackItems,
                        ),
                        Consumer<KeysProvider>(builder: (_, provider, child) {
                          return provider.keySelectorDisplayed
                              ? ZoneSelector(
                                  widgetsKeys: provider.keysTowatch,
                                )
                              : Container();
                        }),
                      ],
                    ),
                    right: const ToolsEffectsWrapper(),
                  )));
  }
}
