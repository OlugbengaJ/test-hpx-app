import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack_item.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard.dart';
import 'package:hpx/apps/z_light/workspace/widgets/zoom_toolbar.dart';
import 'package:hpx/widgets/theme.dart';

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
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 80),
          child: Container(
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
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomLeft,
            fit: StackFit.expand,
            children: [
              Container(
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

              /// Keyboard widget takes a zoom scale which is applied to all keys.
              ///
              /// This ensures seamless zooming of the entire keyboard.
              const Keyboard(zoomScale: 1.4),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(child: ZoomToolbar()),
              )
            ],
          ),
        ),
      ],
    );
  }
}
