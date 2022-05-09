import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/utils/common.dart';
import 'resizable_widget_controller.dart';
import 'drag_distance.dart';


class ColoredResizable extends StatefulWidget {
  const ColoredResizable({
    Key? key,
    required this.child,
    required this.controller,
    required this.dragWidget,
    required this.dragWidgetHeight,
    required this.dragWidgetWidth,
    required this.keysToWatch,
  }) : super(key: key);

  final ResizableWidgetController controller;
  final Widget child;
  final Widget dragWidget;
  final double dragWidgetHeight;
  final double dragWidgetWidth;

  final List<GlobalKey> keysToWatch;

  @override
  State<ColoredResizable> createState() => _ColoredResizableState();
}

class _ColoredResizableState extends State<ColoredResizable> {
  late ResizableWidgetController controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = widget.controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResizableWidgetController>(
      global: false,
      init: widget.controller,
      builder: (controller) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: controller.top,
              left: controller.left,
              bottom: controller.bottom,
              right: controller.right,
              child: widget.child,
            ),
            Positioned(
              top: controller.top - widget.dragWidgetHeight / 2,
              left: controller.left - widget.dragWidgetWidth / 2,
              bottom: controller.bottom - widget.dragWidgetHeight / 2,
              right: controller.right - widget.dragWidgetWidth / 2,
              child: Visibility(
                visible: controller.showDragWidgets,
                child: Stack(
                  children: [
                    // center: given full height an full width so the whole center can be selected and dragged
                    Align(
                      alignment: Alignment.center,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.move,
                        child: DragDistance(
                          child: Opacity(
                            opacity: 0.2,
                            child: Container(
                              key:  controller.draggableKey,
                              color: Colors.transparent,
                              child: SizedBox(
                                height: screenDimension(context).height,
                                width: screenDimension(context).width,
                                //child: dragWidget
                              ),
                            ),
                          ),
                          onDrag: controller.onCenterDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // top left
                    Align(
                      alignment: Alignment.topLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUpLeft,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onTopLeftDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // top center
                    Align(
                      alignment: Alignment.topCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUp,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onTopCenterDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // top right
                    Align(
                      alignment: Alignment.topRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUpRight,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onTopRightDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // center left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeLeft,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onCenterLeftDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),

                    // center right
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeRight,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onCenterRightDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // bottom left
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownLeft,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onBottomLeftDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // bottom center
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDown,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onBottomCenterDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                    // bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownRight,
                        child: DragDistance(
                          child: widget.dragWidget,
                          onDrag: controller.onBottomRightDrag,
                          onDragEnd: (DragEndDetails details){
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
