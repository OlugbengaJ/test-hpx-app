import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/widgets/layer_stack.dart';
import 'package:hpx/providers/apps/zlightspace_providers/keyboard/keys_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

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
  double zoomValue = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _keysSelection() {
    context.read<KeysProvider>().toggleKeySelector(true);
  }

  _selectDraggable() {
    context.read<KeysProvider>().toggleKeySelector(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                'Zone Selection',
                textAlign: TextAlign.left,
                style: h4Style,
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 5.0)),
            SizedBox(
              width: 200,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        textStyle: h3Style),
                    child: const Center(
                      child: Icon(MdiIcons.selectAll),
                    ),
                    onPressed: _keysSelection,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        textStyle: h3Style),
                    child: const Center(child: Icon(MdiIcons.selectDrag)),
                    onPressed: _selectDraggable,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                        textStyle: h3Style),
                    child: const Center(child: Icon(MdiIcons.mouse)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        )),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backdrop.png"),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              fit: StackFit.expand,
              children: [
                const Keyboard(zoomScale: 1.4),
                Transform.scale(
                    scale: zoomValue,
                    child: LayersStack(
                      layers: widget.layers,
                      currentIndex: widget.currentIndex,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ZoomToolbar(
                          zoomIndex: zoomValue,
                          onChange: (double zoom) {
                            setState(() {
                              zoomValue = zoom;
                              print(zoomValue);
                            });
                          }),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
