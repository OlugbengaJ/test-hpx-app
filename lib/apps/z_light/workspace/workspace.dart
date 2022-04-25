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
  final double _zoomInThreshold = 400;
  final double _zoomOutThreshold = 50;
  double _zoomValue = 100;
  double _zoomScale = 1;

  final TextEditingController _zoomCtrl = TextEditingController(text: '100');

  /// zoomIn increase the zoomValue only up to the zoomIn threshold
  /// preventing scenario where content is unnecessarily large.
  void _zoomIn() {
    if (_zoomValue == _zoomInThreshold) return;

    setState(() {
      _zoomValue += 1;
      _updateZoom();
    });
  }

  /// zoomOut decrease the zoomValue only up to the zoomOut threshold
  /// preventing scenario where content is completely not visible.
  void _zoomOut() {
    if (_zoomValue == _zoomOutThreshold) return;

    setState(() {
      _zoomValue -= 1;
      _updateZoom();
    });
  }

  /// updateZoom sets the zoom text and zoom scale.
  void _updateZoom() {
    _zoomCtrl.text = '$_zoomValue';
    _zoomScale = _zoomValue / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: toggle visibility based on Workspace/Lighting Options

        /// Workspace area must be constrained to avoid width/height overflow
        /// i.e. unconstrained error, and ultimately unexpected view behavior.
        ///
        /// Setting width/height with double.infinity is not recommended,
        /// instead we want to keep the view constrained and have excessive
        /// sub-widgets cliped only to the view.
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
              Keyboard(zoomScale: _zoomScale),
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
