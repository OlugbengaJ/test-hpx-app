import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class SublayerItem extends StatefulWidget {
  const SublayerItem(
      {Key? key, required this.layerIndex, required this.layerItemModel})
      : super(key: key);
  final int layerIndex;
  final LayerItemModel layerItemModel;

  @override
  State<SublayerItem> createState() => _SublayerItemState();
}

class _SublayerItemState extends State<SublayerItem> {
  bool _showActions = false;
  bool _editing = false;
  final double _iconSize = 16;
  TextEditingController _layerNameController = TextEditingController(text: "");
  GlobalKey<FormFieldState> editLayerKey = GlobalKey<FormFieldState>(); // Each layer should have a key for its editing field

  Future<void> _deleteLayerDialog(LayersProvider provider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete a layer'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Do you wish to delete this layer?'),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                        
                      ),
                      TextButton(
                        onPressed: (){
                          provider.removeSubItem(widget.layerItemModel);
                          Navigator.of(context).pop();
                        },
                        style: textBtnStyleWhite,
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          
        );
      },
    );
  }

  _onHover(isHovering) {
    setState(() {
      _showActions = isHovering;
    });
  }

  /// Save the current editing layer if the textfield loses focus
  _onFocusChange(LayersProvider provider) {
    provider.saveEditingSubLayer();
  }

  _toggleLayer(LayersProvider provider) {
    LayerItemModel layerItemModel = widget.layerItemModel;
    layerItemModel.visible = !layerItemModel.visible;
    provider.toggleSublayerVisibility(layerItemModel, widget.layerIndex);
  }


  _toggleEditing(LayersProvider provider) {
    /// Check if the layer is not already in edit mode
    if (!provider.isLayerEditing) {
      provider.setEditingSubLayerKey(editLayerKey, widget.layerItemModel.id);
      setState(() {
        _editing = provider.isTheCurrentSubLayerEditing(editLayerKey);
        _layerNameController = TextEditingController(
            text: widget.layerItemModel.layerText);
      });
      provider.toggleEditMode(true);
    } else {
      /// Save the already editing layer and if the new layer to edit is different then retoggle it
      provider.saveEditingSubLayer();
      provider.setEditingLayerKey(editLayerKey, widget.layerItemModel.id);
      _toggleEditing(provider);
    }
  }

  _deleteLayer(LayersProvider provider) {
    _deleteLayerDialog(provider);
  }

  _onTap(LayersProvider provider) {
    provider.changeSublayerIndex(widget.layerIndex);
  }

  _onSubmit(value, LayersProvider provider) {
    setState(() {
      _editing = !_editing;
    });
    provider.updateSublayer(widget.layerItemModel, value);
    provider.toggleEditMode(false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 2),
          child: InkWell(
            onHover: _onHover,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _onTap(provider),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 30),
              color: Colors.black12,
              child: SizedBox(
                height: 35,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => _toggleLayer(provider),
                        child: Tooltip(
                          message: "Toogle visibility",
                          child: Icon(
                            Ionicons.eye,
                            size: _iconSize,
                            color: widget.layerItemModel.listDisplayColor,
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
                              (_editing  && provider.isLayerEditing)
                                  ? Container(
                                      height: 30,
                                      constraints: const BoxConstraints(
                                        maxWidth: 80,
                                      ),
                                      child: Focus(
                                        onFocusChange: (hasFocus) {
                                          if (!hasFocus) {
                                            _onSubmit(_layerNameController.text,
                                                provider);
                                          }
                                        },
                                        child: Focus(
                                          onFocusChange: (hasFocus) {
                                            if (!hasFocus) {
                                              _onFocusChange(provider);
                                            }
                                          },
                                          child: TextFormField(
                                            key: editLayerKey,
                                            controller: _layerNameController,
                                            autofocus: true,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            decoration: const InputDecoration(
                                                focusColor: Colors.white,
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.all(8)),
                                            onFieldSubmitted: (value) =>
                                                _onSubmit(value, provider),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Consumer<LayersProvider>(
                                        builder: (context, value, child) {
                                          return Text(
                                            widget.layerItemModel.layerText,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: widget.layerItemModel
                                                    .listDisplayColor),
                                          );
                                        },
                                      ),
                                    ),
                              (_showActions)
                                  ? Consumer<LayersProvider>(
                                      builder: (context, value, child) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 26),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Tooltip(
                                              message: "Edit",
                                              child: InkWell(
                                                child: Icon(
                                                  Ionicons.create,
                                                  size: _iconSize,
                                                  color: widget.layerItemModel
                                                      .listDisplayColor,
                                                ),
                                                onTap: () =>
                                                    _toggleEditing(value),
                                              ),
                                            ),
                                            Tooltip(
                                              message: "Delete",
                                              preferBelow: false,
                                              child: InkWell(
                                                child: Icon(
                                                  Ionicons.trash,
                                                  size: _iconSize,
                                                  color: widget.layerItemModel
                                                      .listDisplayColor,
                                                ),
                                                onTap: () =>
                                                    _deleteLayer(value),
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
        );
      },
    );
  }
}
