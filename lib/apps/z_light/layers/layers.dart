import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_list_item.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/utils/common.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

/// Layers Widget to manipulate list layers
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialLayer();
    });
  }


  /// [initialLayer] add a default layer to the workspace if there no layer available
  void initialLayer(){
    LayersProvider provider = context.read<LayersProvider>();
    if(provider.length<1){
      _addLayer();
    }
  }
  

  /// [_addLayer] used to add a layer to the available list
  /// use the [ModeProvider] the set the newly created layer name
  _addLayer() {
    context.read<ResizableProvider>().initialize(
      Offset(areaWidth / 2, areaHeight / 2),
    );

    ModeProvider modeProvider = context.read<ModeProvider>();
    var provider = context.read<LayersProvider>();
    int id = 1; // For first element;
    if (provider.layeritems.isNotEmpty) {
      for (var element in provider.layeritems ) {
        if (element.id > id) {
          id = element.id;
        }
      }
      id = id + 1;
    }

    provider.add(
      LayerItemModel(
        id: id,
        layerText: (provider.length>0)?modeProvider.getModeInformation().name: "Mood",
        mode: modeProvider.getModeInformation(),
        top: context.read<ResizableProvider>().top,
        bottom: context.read<ResizableProvider>().bottom,
        left: context.read<ResizableProvider>().left,
        right: context.read<ResizableProvider>().right,
        icon: (provider.length>0)?modeProvider.getModeInformation().icon: Icons.mood
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    //_addLayer();
    return Consumer<LayersProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                    onPressed: () => _addLayer(),
                    style: textBtnStyleWhite,
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
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  color: Colors.black12,
                  height: screenDimension(context).height,
                  child: Consumer<LayersProvider>(
                    builder: (_, provider, child) {
                      return ReorderableListView.builder(
                        buildDefaultDragHandles: false,
                        padding: const EdgeInsets.all(2),
                        itemCount: provider.length,
                        scrollController:
                            ScrollController(keepScrollOffset: false),
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
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
