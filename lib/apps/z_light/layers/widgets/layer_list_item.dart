import 'package:flutter/material.dart';


class LayerListItem extends StatefulWidget {
  const LayerListItem({ Key? key }) : super(key: key);

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  bool _showActions = false;
  _onHover(isHovering){
    setState(() {
      _showActions = isHovering;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: _onHover,
      hoverColor: Colors.black12,
      onTap: (){
        //print("Tapped");
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: Colors.black12,
        child: Row(
          children: [
            const Icon(Icons.remove_red_eye),
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
                      Row(
                        children: const [
                          Icon(Icons.create_outlined),
                          Icon(Icons.delete_outlined),
                          Icon(Icons.format_line_spacing_outlined),
                        ],
                      ): Container()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}