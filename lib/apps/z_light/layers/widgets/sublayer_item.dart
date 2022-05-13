import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class SublayerItem extends StatefulWidget {
  const SublayerItem({ Key? key, required this.layerIndex, required this.layerItemModel }) : super(key: key);
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

  @override
  void initState() {
    super.initState();
  }

  _onHover(isHovering) {
    setState(() {
      _showActions = isHovering;
    });
  }

  _toggleLayer(provider) {
    LayerItemModel layerItemModel = widget.layerItemModel;
    provider.toggleVisibility(
        LayerItemModel(
            id: layerItemModel.id,
            layerText: layerItemModel.layerText,
            mode: layerItemModel.mode,
            visible: !layerItemModel.visible,
            controller: layerItemModel.controller),
        widget.layerIndex);
  }

  _toggleEditing(value) {
    setState(() {
      _editing = !_editing;
      _layerNameController = TextEditingController(
          text: widget.layerItemModel.layerText);
    });
  }

  _deleteLayer(provider){
    provider.removeSubItem(widget.layerItemModel);
  }

  _onTap(provider) {
    provider.changeIndex(widget.layerIndex);
  }

  _onSubmit(value, provider) {
    setState(() {
      _editing = !_editing;
    });
    provider.updateSublayer(widget.layerItemModel, value);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, _value, child) {
        return Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 2),
          child: InkWell(
            onHover: _onHover,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _onTap(_value),
            child: Container(
              padding: const EdgeInsets.only(top:2, bottom: 2, right: 2, left: 30),
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
                              (_editing)
                                  ? Container(
                                      height: 30,
                                      constraints: const BoxConstraints(
                                        maxWidth: 80,
                                      ),
                                      child: TextFormField(
                                        controller: _layerNameController,
                                        autofocus: true,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        decoration: const InputDecoration(
                                            focusColor: Colors.white,
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.all(8)),
                                        onFieldSubmitted: (value) =>
                                            _onSubmit(value, _value),
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
                                                onTap: () => _deleteLayer(value),
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