import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/resizable/stateful_resizable.dart';
import 'package:hpx/apps/z_light/layers/resizable/stateless_resizable.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';

class LayersStack extends StatefulWidget {
  const LayersStack({Key? key}) : super(key: key);

  @override
  State<LayersStack> createState() => _LayersStackState();
}

class _LayersStackState extends State<LayersStack> {
  double dragWidgetSize = 5;

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(
      builder: (context, value, child) {
        return 
        (value.hideStackedLayers)? Container():
        Stack(
          children: [
            StatelessResizable(
              dragWidgetHeight: dragWidgetSize,
              dragWidgetWidth: dragWidgetSize,
              dragWidget: Container(
                height: dragWidgetSize,
                width: dragWidgetSize,              
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
