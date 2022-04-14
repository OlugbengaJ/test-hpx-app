import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class LayerListItem extends StatefulWidget {
  const LayerListItem({ Key? key, required this.deleteItem, required this.layerID, required this.currentIndex }) : super(key: key);
  final Function deleteItem;
  final int layerID;
  final int currentIndex;

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  bool _shown = true;
  bool _editing = false;
  final double _iconSize = 16;
  TextEditingController _layerNameController = TextEditingController(text: "");


  @override
  void initState() {
    super.initState();
    setState(() {
      _layerNameController = TextEditingController(text: "New layer ${widget.layerID}");
    });
  }

  _onHover(isHovering){
    setState(() {
      _showActions = isHovering;
    });
  }

  _toggleLayer(){
    setState(() {
      _shown = !_shown;
    });
  }

  _toggleEditing(){
    setState(() {
      _editing = !_editing;
    });
  }

  _onTap(){
    
  }

  _onEdited (value){
    setState(() {
      _editing = !_editing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(bottom: 2),
      child: InkWell(            
        onHover: _onHover,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: _onTap,
        child: Container(
          padding: const EdgeInsets.all(2),
          color: Colors.black12,
          child: SizedBox(
            height: 25,
            child: Row(
              children: [
                InkWell(
                  onTap: _toggleLayer,
                  child:
                  (_shown)?
                  Icon(
                    Ionicons.eye,
                    size: _iconSize,
                  ):
                  Icon(
                    Ionicons.eye_off,
                    size: _iconSize,
                  )
                ),
                const SizedBox(width: 2,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children:[
                          Icon(
                            Ionicons.image,
                            size: _iconSize,
                          ),
                          (_editing)?
                          Container(
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
                                contentPadding: EdgeInsets.all(8)                                 
                              ),
                              onFieldSubmitted: _onEdited,
                            ),
                          ): 
                          Expanded(
                            child:
                            Text(
                              _layerNameController.text,
                              overflow: TextOverflow.ellipsis,
                              
                            ),
                          ),
                          (_showActions)?
                          Container(
                            margin: const EdgeInsets.only(right: 26),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                  onTap: (){
                                    widget.deleteItem(widget.layerID);
                                  },
                                ),                              
                              ],
                            ),
                          ): Container()
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
  }
}