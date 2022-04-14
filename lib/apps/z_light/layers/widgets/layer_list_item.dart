import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class LayerListItem extends StatefulWidget {
  const LayerListItem({ Key? key, required this.deleteItem }) : super(key: key);
  final Function deleteItem;

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  bool _shown = true;

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

  _onTap(){
    setState(() {
      _shown = !_shown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Row(
            children: [
              InkWell(
                onTap: _toggleLayer,
                child:
                (_shown)?
                Icon(LineIcons.eye):
                Icon(LineIcons.eyeSlash)
              ),
              SizedBox(width: 2,),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children:[
                        const Icon(Icons.image),
                        const Expanded(
                          child: Text("Type"),
                        ),
                        (_showActions)?
                        Container(
                          margin: EdgeInsets.only(right: 32),
                          child: Row(
                            children: [
                              Icon(Icons.create_outlined),
                              InkWell(
                                child: Icon(LineIcons.trash),
                                onTap: (){
                                  widget.deleteItem();
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
    );
  }
}