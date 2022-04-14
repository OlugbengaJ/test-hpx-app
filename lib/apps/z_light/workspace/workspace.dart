import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';

class Workspace extends StatefulWidget {
  const Workspace({ Key? key }) : super(key: key);

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: LayersStack()
          ),
          LayersStack(),
        ],
      )
    );
  }
}