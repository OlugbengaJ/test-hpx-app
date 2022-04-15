import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';

class LayerStackItem extends StatefulWidget {
  const LayerStackItem({ Key? key, required this.layerID, this.color = Colors.black, this.visible = true  }) : super(key: key);
  final int layerID;
  final Color color;
  final bool visible;

  @override
  State<LayerStackItem> createState() => _LayerStackItemState();
}

class _LayerStackItemState extends State<LayerStackItem> {
  double dragWidgetSize = 50;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    final areaHeight = Get.height * 0.70;
    final areaWidth = Get.width * 0.70;
    final controller = Get.put(
      ResizableWidgetController(
        initialPosition: Offset(areaWidth / 2, areaHeight / 2),
        areaHeight: areaHeight,
        areaWidth: areaWidth,
        height: areaHeight / 2,
        width: areaWidth / 2,
        minWidth: 50,
        minHeight: 50,
      ),
    );

    _toggleItem(){
      setState(() {
        _visible =! _visible;
      });
    }


    return 
    (_visible)?
    Container(
      color: Colors.transparent,
      child: ResizableWidget(
        dragWidgetHeight: dragWidgetSize,
        dragWidgetWidth: dragWidgetSize,
        controller: controller,
        dragWidget: Container(
          height: 50,
          width: 50,
          child: Center(
            child: Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
          ),
        ),
        child: Container(     
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ):Container();
  }
}