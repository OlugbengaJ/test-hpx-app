import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
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
    return Container();

    /* return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        print("Notification");
        return true;
      },
      child: Consumer<LayersProvider>(
        builder: (context, value, child) {
          return 
          (value.hideDraggable)? 
          Consumer<ResizableProvider>(
            builder: (context, provider, child) {
              return SizedBox(
                height: 0,
                width: 0,
                key:  provider.draggableKey,
              );
            }
          ):
          Stack(
            children: [
              (value.isLayerVisible)?
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
              )
              :
              Consumer<ResizableProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    height: 0,
                    width: 0,
                    key:  provider.draggableKey,
                  );
                }
              ),
            ],
          );
        },
      ),
    ); */
  }
}
