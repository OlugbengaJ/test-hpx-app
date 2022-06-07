import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/sublayer_item.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:hpx/widgets/components/picker_dropdown.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class LayerListItem extends StatefulWidget {
  const LayerListItem(
      {Key? key, required this.layerIndex, required this.layerItemModel})
      : super(key: key);

  final int layerIndex;
  final LayerItemModel layerItemModel;

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  bool _showDeleteTooltip = false;
  bool _editing = false;
  final double _iconSize = 16;
  TextEditingController _layerNameController = TextEditingController(text: "");
  GlobalKey deleteKey = GlobalKey<State<Tooltip>>();
  GlobalKey<FormFieldState> editLayerKey = GlobalKey<FormFieldState>(); // Each layer should have a key for its editing field

  _onHover(isHovering) {
    if (!_showDeleteTooltip) {
      setState(() {
        _showActions = isHovering;
      });
    }
  }

  _toggleLayer(LayersProvider provider) {
    LayerItemModel layerItemModel = widget.layerItemModel;
    layerItemModel.visible = !layerItemModel.visible;
    provider.toggleVisibility(layerItemModel, widget.layerIndex);
  }

  /// Duplicate a layer or create a sublayer dependinf the layer's mode.
  /// Only create sublayers for Shortcut Colors
  _duplicateOrCreatSubLayer(LayersProvider provider) {
    ModeProvider modeProvider = context.read<ModeProvider>();
    if (widget.layerItemModel.mode!.name == "Shortcut Colors") {
      provider.duplicateOrCreatSubLayer(
          widget.layerItemModel, widget.layerIndex, modeProvider,
          sublayer: true);
    } else {
      provider.duplicateOrCreatSubLayer(
          widget.layerItemModel, widget.layerIndex, modeProvider);
    }
  }

  /// Use to edit the layer's text
  _toggleEditing(LayersProvider provider) {
    /// Check if the layer is not already in edit mode
    if(!provider.isLayerEditing){      
      provider.setEditingLayerKey(editLayerKey, widget.layerItemModel.id);
      setState(() {
        _editing = provider.isTheCurrentLayerEditing(editLayerKey);
        _layerNameController = TextEditingController(text: provider.getItem(widget.layerIndex).layerText);
      });
      provider.toggleEditMode(true);
    }else{
      /// Save the already editing layer and if the new layer to edit is different then retoggle it
      provider.saveEditingLayer();
      provider.setEditingLayerKey(editLayerKey, widget.layerItemModel.id);
      _toggleEditing(provider);
    }    
    
  }


  /// Save the current editing layer if the textfield loses focus
  _onFocusChange(LayersProvider provider){
    provider.saveEditingLayer();
  }

  /// Use to delete a layer from the list
  _deleteLayer(LayersProvider provider) {
    provider.removeItem(widget.layerIndex);
    // final dynamic tooltip = deleteKey.currentState;
    // tooltip?.ensureTooltipVisible();
    // setState(() {
    //   _showDeleteTooltip = true;
    // });    
  }

  // Tap on a layer to select it
  _onTap(LayersProvider provider) {
    provider.changeIndex(widget.layerIndex);
    ModeProvider modeProvider = context.read<ModeProvider>();
    modeProvider.changeModeComponent(
        PickerModel(
            title: widget.layerItemModel.mode!.name,
            value: widget.layerItemModel.mode!.value,
            enabled: true,
            icon: widget.layerItemModel.mode!.icon),
        context);
  }

  /// Save the layer's new text
  _onSubmit(String value, LayersProvider provider) {
    if(value.isNotEmpty){
      setState(() {
        _editing = !_editing;
      });
      provider.update(widget.layerItemModel.id, value);
      provider.toggleEditMode(false);
    }
    
  }

  /// Widget method to list sublayers
  List<Widget> _sublayers(LayersProvider provider) {
    List<Widget> layers = [];
    if (widget.layerItemModel.hasSublayer) {
      int index = 0;
      for (var item in provider.getSublayers(widget.layerItemModel.id)) {
        layers.add(SublayerItem(layerIndex: index, layerItemModel: item));
        index++;
      }
    }
    return layers;
  }

  @override
  Widget build(BuildContext context) {
    _editing = context.read<LayersProvider>().isTheCurrentLayerEditing(editLayerKey);

    return Consumer<LayersProvider>(
      builder: (context, _value, child) {
        return Column(
          children: <Widget>[
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 2),
                  child: InkWell(
                    onHover: _onHover,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => _onTap(_value),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      color: Colors.black12,
                      child: SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () => _toggleLayer(_value),
                                child: Tooltip(
                                  message: "Toogle visibility",
                                  child: Icon(
                                    (_value.getItem(widget.layerIndex).visible)
                                        ? Ionicons.eye
                                        : Ionicons.eye_off,
                                    size: _iconSize,
                                    color:
                                        widget.layerItemModel.listDisplayColor,
                                  ),
                                )),
                            const SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        widget.layerItemModel.mode!.icon,
                                        color: widget
                                            .layerItemModel.listDisplayColor,
                                        size: _iconSize,
                                      ),
                                      (_editing && _value.isLayerEditing)
                                          ? Container(
                                              height: 30,
                                              constraints: const BoxConstraints(
                                                maxWidth: 80,
                                              ),
                                              child: Focus(
                                                onFocusChange: (hasFocus) {
                                                  if(!hasFocus) {
                                                    _onFocusChange(_value);
                                                  }
                                                },
                                                child: TextFormField(
                                                  key: editLayerKey,
                                                  controller: _layerNameController,                                                
                                                  autofocus: true,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                          focusColor:
                                                              Colors.white,
                                                          border:
                                                              OutlineInputBorder(),
                                                          contentPadding:
                                                              EdgeInsets.all(8)),
                                                  onFieldSubmitted: (value) =>  _onSubmit(value, _value),
                                                  
                                                ),
                                                
                                              ),
                                            )
                                          : Expanded(
                                              child: Consumer<LayersProvider>(
                                                builder:
                                                    (context, value, child) {
                                                  return Text(
                                                    value
                                                        .getItem(
                                                            widget.layerIndex)
                                                        .layerText,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: widget
                                                            .layerItemModel
                                                            .listDisplayColor),
                                                  );
                                                },
                                              ),
                                            ),
                                      (_showActions || _showDeleteTooltip)
                                          ? Consumer<LayersProvider>(
                                              builder: (context, value, child) {
                                              return Container(
                                                //margin: const EdgeInsets.only(right: 26),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Tooltip(
                                                      message: (widget
                                                                  .layerItemModel
                                                                  .mode!
                                                                  .name ==
                                                              "Shortcut Colors")
                                                          ? "Add sublayer"
                                                          : "Duplicate",
                                                      child: InkWell(
                                                        child: Icon(
                                                          Ionicons.copy,
                                                          size: _iconSize,
                                                          color: widget
                                                              .layerItemModel
                                                              .listDisplayColor,
                                                        ),
                                                        onTap: () =>
                                                            _duplicateOrCreatSubLayer(
                                                                value),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      message: "Edit",
                                                      child: InkWell(
                                                        child: Icon(
                                                          Ionicons.create,
                                                          size: _iconSize,
                                                          color: widget
                                                              .layerItemModel
                                                              .listDisplayColor,
                                                        ),
                                                        onTap: () =>
                                                            _toggleEditing(
                                                                value),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      child: InkWell(
                                                        child: Icon(
                                                          Ionicons.trash,
                                                          size: _iconSize,
                                                          color: widget
                                                              .layerItemModel
                                                              .listDisplayColor,
                                                        ),
                                                        onTap: () =>
                                                            _deleteLayer(value),
                                                      ),
                                                    ),
                                                    Tooltip(
                                                      key: deleteKey,
                                                      showDuration:
                                                          const Duration(
                                                              seconds: 2),
                                                      padding: EdgeInsets.zero,
                                                      richMessage: TextSpan(
                                                          children: [
                                                            WidgetSpan(
                                                                alignment:
                                                                    PlaceholderAlignment
                                                                        .baseline,
                                                                baseline:
                                                                    TextBaseline
                                                                        .alphabetic,
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .black,
                                                                  constraints:
                                                                      const BoxConstraints(
                                                                          maxWidth:
                                                                              150),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        padding:
                                                                            const EdgeInsets.all(4),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                            "Delete this layer",
                                                                            style:
                                                                                TextStyle(
                                                                              backgroundColor: Colors.black,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        padding:
                                                                            const EdgeInsets.all(4),
                                                                        child: Row(
                                                                            children: [
                                                                              Expanded(
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                GestureDetector(
                                                                                    child: const Text("Cancel"),
                                                                                    onTap: () {
                                                                                      print("OK");
                                                                                    })
                                                                              ])),
                                                                              Expanded(
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                                                                TextButton(
                                                                                    child: const Text("Got It"),
                                                                                    style: TextButton.styleFrom(
                                                                                      primary: Colors.black,
                                                                                      backgroundColor: Colors.white,
                                                                                    ),
                                                                                    onPressed: () {})
                                                                              ])),
                                                                            ]),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )),
                                                          ]),
                                                      preferBelow: false,
                                                      child: Container(),
                                                    ),
                                                    Tooltip(
                                                      message: "Rearrange",
                                                      child:
                                                          ReorderableDragStartListener(
                                                        index:
                                                            widget.layerIndex,
                                                        child: GestureDetector(
                                                          child: InkWell(
                                                            child: Icon(
                                                              Ionicons.list,
                                                              size: _iconSize,
                                                              color: widget
                                                                  .layerItemModel
                                                                  .listDisplayColor,
                                                            ),
                                                            onTap: () => {},
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            })
                                          : Container()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ] +
              _sublayers(_value),
        );
      },
    );
  }
}
