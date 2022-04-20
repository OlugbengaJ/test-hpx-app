import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/workspace/widgets/zoom_toolbar.dart';
import 'package:hpx/widgets/theme.dart';

import '../layers/widgets/layer_stack_item.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key, required this.layers, required this.currentIndex})
      : super(key: key);

  final List<LayerStackItem> layers;
  final int currentIndex;

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: toggle visibility based on Workspace/Lighting Options
        Container(
          margin: const EdgeInsets.only(right: 5.0, top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Zone Selection',
                textAlign: TextAlign.left,
                style: h4Style,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              // width: double.infinity,
              // height: MediaQuery.of(context).size.height, // avoid double.infinity to avoid height overflow
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: MediaQuery.of(context).size.height - 70,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backdrop.png"),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: LayersStack(
                layers: widget.layers,
                currentIndex: widget.currentIndex,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    // TODO: refactor to use themes
                    color: Color.fromARGB(255, 54, 53, 53),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: const SizedBox(
                    width: 160,
                    height: 40,
                    child: ZoomToolbar(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
