import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class LayerListItem extends StatefulWidget {
  const LayerListItem({ Key? key, required this.deleteItem, required this.layerID }) : super(key: key);
  final Function deleteItem;
  final int layerID;

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  bool _shown = true;
  bool _editing = false;
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
    setState(() {
      _shown = !_shown;
    });
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
        onTap: (){
          //print("Tapped");
        },
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
                  const Icon(LineIcons.eye):
                  const Icon(LineIcons.eyeSlash)
                ),
                const SizedBox(width: 2,),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children:[
                          const Icon(Icons.image),
                          Expanded(
                            child:
                            (_editing)?
                            SizedBox(
                              height: 25,
                              width: 50,
                              child: TextField(
                                controller: _layerNameController,
                                autofocus: true,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                decoration: const InputDecoration(
                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(
                                  ),                                  
                                ),
                                onSubmitted: _onEdited,
                              ),
                            ): 
                            Text(
                              _layerNameController.text,
                              overflow: TextOverflow.ellipsis,
                              
                            ),
                          ),
                          (_showActions)?
                          Container(
                            margin: EdgeInsets.only(right: 26),
                            child: Row(
                              children: [
                                InkWell(
                                  child: const Icon(Icons.create_outlined),
                                  onTap: _toggleEditing,
                                ),
                                InkWell(
                                  child: const Icon(LineIcons.trash),
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