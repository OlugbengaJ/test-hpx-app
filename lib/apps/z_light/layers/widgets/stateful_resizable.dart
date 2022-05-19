import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/apps/z_light/layers/widgets/drag_distance.dart';
import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:hpx/utils/common.dart';
import 'package:provider/provider.dart';

class StatefulResizableWidget extends StatefulWidget {
  const StatefulResizableWidget({
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
  State<StatefulResizableWidget> createState() =>
      _StatefulResizableWidgetState();
}

class _StatefulResizableWidgetState extends State<StatefulResizableWidget> {


  _onDragEnd(provider) {
    widget.controller.onDragEnd(provider);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayersProvider>(builder: (_, provider, child) {
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
                            onDrag: controller.onCenterDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: Container(
                              key: controller.draggableKey,
                              color: Colors.transparent,
                              height: screenDimension(context).height - widget.dragWidgetHeight,
                              width: screenDimension(context).width - widget.dragWidgetWidth,
                              //child: dragWidget
                            ),
                          ),
                        ),
                      ),
                      // top left
                      Align(
                        alignment: Alignment.topLeft,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeUpLeft,
                          child: DragDistance(                           
                            onDrag: controller.onTopLeftDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // top center
                      Align(
                        alignment: Alignment.topCenter,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeUp,
                          child: DragDistance(                            
                            onDrag: controller.onTopCenterDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // top right
                      Align(
                        alignment: Alignment.topRight,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeUpRight,
                          child: DragDistance(                            
                            onDrag: controller.onTopRightDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // center left
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeLeft,
                          child: DragDistance(                            
                            onDrag: controller.onCenterLeftDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),

                      // center right
                      Align(
                        alignment: Alignment.centerRight,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeRight,
                          child: DragDistance(
                            onDrag: controller.onCenterRightDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // bottom left
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeDownLeft,
                          child: DragDistance(
                            onDrag: controller.onBottomLeftDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // bottom center
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeDown,
                          child: DragDistance(
                            onDrag: controller.onBottomCenterDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
                          ),
                        ),
                      ),
                      // bottom right
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.resizeDownRight,
                          child: DragDistance(
                            onDrag: controller.onBottomRightDrag,
                            onDragEnd: (DragEndDetails details) {
                              _onDragEnd(provider);
                            },
                            child: widget.dragWidget,
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
    });
  }
}
