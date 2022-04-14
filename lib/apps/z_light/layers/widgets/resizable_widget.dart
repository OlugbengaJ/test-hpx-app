import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resizable_widget_controller.dart';
import 'drag_distance.dart';

class ResizableWidget extends StatelessWidget {
  const ResizableWidget({
    Key? key,
    required this.child,
    required this.controller,
    required this.dragWidget,
    required this.dragWidgetHeight,
    required this.dragWidgetWidth,
  }) : super(key: key);

  final ResizableWidgetController controller;
  final Widget child;
  final Widget dragWidget;
  final double dragWidgetHeight;
  final double dragWidgetWidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResizableWidgetController>(
      global: false,
      init: controller,
      builder: (controller) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: controller.top,
              left: controller.left,
              bottom: controller.bottom,
              right: controller.right,
              child: child,
            ),
            Positioned(
              top: controller.top - dragWidgetHeight / 2,
              left: controller.left - dragWidgetWidth / 2,
              bottom: controller.bottom - dragWidgetHeight / 2,
              right: controller.right - dragWidgetWidth / 2,
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
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            //child: dragWidget
                          ),
                          onDrag: controller.onCenterDrag,
                        ),
                      ),
                    ),
                    // top left
                    Align(
                      alignment: Alignment.topLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUpLeft,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onTopLeftDrag,
                        ),
                      ),
                    ),
                    // top center
                    Align(
                      alignment: Alignment.topCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUp,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onTopCenterDrag,
                        ),
                      ),
                    ),
                    // top right
                    Align(
                      alignment: Alignment.topRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUpRight,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onTopRightDrag,
                        ),
                      ),
                    ),
                    // center left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeLeft,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onCenterLeftDrag,
                        ),
                      ),
                    ),
                    
                    // center right
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeRight,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onCenterRightDrag,
                        ),
                      ),
                    ),
                    // bottom left
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownLeft,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onBottomLeftDrag,
                        ),
                      ),
                    ),
                    // bottom center
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDown,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onBottomCenterDrag,
                        ),
                      ),
                    ),
                    // bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownRight,
                        child: DragDistance(
                          child: dragWidget,
                          onDrag: controller.onBottomRightDrag,
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