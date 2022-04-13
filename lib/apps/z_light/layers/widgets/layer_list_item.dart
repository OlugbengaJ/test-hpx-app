import 'package:flutter/material.dart';


class LayerListItem extends StatefulWidget {
  const LayerListItem({ Key? key }) : super(key: key);

  @override
  State<LayerListItem> createState() => _LayerListItemState();
}

class _LayerListItemState extends State<LayerListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Icon(Icons.remove_red_eye),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.image),
                    Expanded(
                      child: Text("Type"),
                    ),
                    Icon(Icons.create_outlined),
                    Icon(Icons.delete_outlined),
                    Icon(Icons.format_line_spacing_outlined),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}