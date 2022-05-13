import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/sublayer_item.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
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


  _duplicate(provider){
    if(widget.layerItemModel.mode.name=="Shortcut Colors"){
      provider.duplicate(widget.layerItemModel, widget.layerIndex, sublayer: true);
    }else{
      provider.duplicate(widget.layerItemModel, widget.layerIndex);
    }
    
  }

  _toggleEditing(value) {
    setState(() {
      _editing = !_editing;
      _layerNameController = TextEditingController(
          text: value.getItem(widget.layerIndex).layerText);
    });
  }

  _deleteLayer(provider){
    provider.removeItem(widget.layerIndex);
  }

  _onTap(provider) {
    provider.changeIndex(widget.layerIndex);
  }

  _onSubmit(value, provider) {
    setState(() {
      _editing = !_editing;
    });
    provider.update(
        LayerItemModel(
            id: widget.layerItemModel.id,
            mode: widget.layerItemModel.mode,
            layerText: value,
            controller: widget.layerItemModel.controller),
        widget.layerIndex);
  }

  List<Widget> _sublayers(provider){
    List<Widget> layers = [];
    if(widget.layerItemModel.hasSublayer){
      int index = 0;
      for(var item in provider.getSublayers(widget.layerItemModel.id)){
        layers.add(SublayerItem(layerIndex: index, layerItemModel: item));
        index ++;
      }
    }
    return layers;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, _value, child) {
        return Column(
          children: <Widget> [
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
                                  Icon(
                                    Ionicons.image,
                                    color: widget.layerItemModel.listDisplayColor,
                                    size: _iconSize,
                                  ),
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
                                                value
                                                    .getItem(widget.layerIndex)
                                                    .layerText,
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
                                                  message: (widget.layerItemModel.layerText=="Shortcut Colors")? "Add sublayer" :"Duplicate",
                                                  child: InkWell(
                                                    child: Icon(
                                                      Ionicons.copy,
                                                      size: _iconSize,
                                                      color: widget.layerItemModel
                                                          .listDisplayColor,
                                                    ),
                                                    onTap: () => _duplicate(value),
                                                  ),
                                                ),
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
            ),
          ] + _sublayers(_value),
        );
      },
    );
  }
}
