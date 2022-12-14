import 'package:flutter/material.dart';
import 'package:hpx/models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class LayerListItem extends StatefulWidget {
  const LayerListItem(
      {Key? key, required this.layerID, required this.layerItemModel})
      : super(key: key);

  final int layerID;
  final LayerItemModel layerItemModel;

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  bool _editing = false;
  final double _iconSize = 16;
  TextEditingController _layerNameController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    setState(() {
      _layerNameController = TextEditingController(text: widget.layerItemModel.layerText);
    });
  }

  _onHover(isHovering) {
    setState(() {
      _showActions = isHovering;
    });
  }

  _toggleLayer(provider) {
    LayerItemModel layerItemModel = provider.getItem(widget.layerID);
    provider.toggleVisibility(LayerItemModel(id: layerItemModel.id, layerText: layerItemModel.layerText, visible: !layerItemModel.visible, controller: layerItemModel.controller), widget.layerID);
  }

  _toggleEditing() {
    setState(() {
      _editing = !_editing;
    });
  }

  _onTap(provider) {
    provider.changeIndex(widget.layerID);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, _value, child) {
        return Container(
          height: 30,
          margin: const EdgeInsets.only(bottom: 2),
          child: InkWell(
            onHover: _onHover,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: ()=> _onTap(_value),
            child: Container(
              padding: const EdgeInsets.all(2),
              color: Colors.black12,
              child: SizedBox(
                height: 25,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => _toggleLayer(_value),
                        child: (_value.getItem(widget.layerID).visible)
                            ? Icon(
                                Ionicons.eye,
                                size: _iconSize,
                              )
                            : Icon(
                                Ionicons.eye_off,
                                size: _iconSize,
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
                                Ionicons.image,
                                size: _iconSize,
                              ),
                              (_editing)
                                  ? Container(
                                      height: 20,
                                      constraints: const BoxConstraints(
                                        maxWidth: 80,
                                      ),
                                      child: TextFormField(
                                        controller: _layerNameController,
                                        autofocus: true,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        decoration: const InputDecoration(
                                            focusColor: Colors.white,
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.all(8)),
                                        onFieldSubmitted: (value) {
                                          setState(() {
                                            _editing = !_editing;
                                          });
                                          LayerItemModel layerItemModel =
                                              _value.getItem(widget.layerID);
                                          _value.update(
                                              LayerItemModel(
                                                id: widget.layerID,
                                                layerText: value,
                                                controller: layerItemModel.controller
                                              ),
                                              widget.layerID);
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: Consumer<LayersProvider>(
                                        builder: (context, value, child) {
                                          return Text(
                                            value
                                                .getItem(widget.layerID)
                                                .layerText,
                                            overflow: TextOverflow.ellipsis,
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
                                            InkWell(
                                              child: Icon(
                                                Ionicons.create,
                                                size: _iconSize,
                                              ),
                                              onTap: _toggleEditing,
                                            ),
                                            InkWell(
                                              child: Icon(
                                                Ionicons.trash,
                                                size: _iconSize,
                                              ),
                                              onTap: () => value
                                                  .removeItem(widget.layerID),
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
