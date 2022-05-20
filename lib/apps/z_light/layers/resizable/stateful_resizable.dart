import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';
import 'provider/resizable.dart';
import 'drag_distance.dart';

class StatefulResizableWidget extends StatefulWidget {
  const StatefulResizableWidget({ 
    Key? key ,
    required this.child,
    required this.dragWidget,
    required this.dragWidgetHeight,
    required this.dragWidgetWidth,
  }) : super(key: key);

  final Widget child;
  final Widget dragWidget;
  final double dragWidgetHeight;
  final double dragWidgetWidth;

  @override
  State<StatefulResizableWidget> createState() => _StatefulResizableWidgetState();
}

class _StatefulResizableWidgetState extends State<StatefulResizableWidget> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final areaHeight = Get.height * 0.70;
    final areaWidth = Get.width * 0.70;

    context.read<ResizableProvider>().initialize(
      Offset(areaWidth / 2, areaHeight / 2),
    );
  }


  _onDragEnd(provider){
    LayersProvider layersProvider = context.read<LayersProvider>();
    provider.onDragEnd(layersProvider);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ResizableProvider>(
      builder: (_, provider, child)
       {
        return Stack(
          children: <Widget>[
            Positioned(
              top: provider.top,
              left: provider.left,
              bottom: provider.bottom,
              right: provider.right,
              child: widget.child,
            ),
            Positioned(
              top: provider.top - widget.dragWidgetHeight / 2,
              left: provider.left - widget.dragWidgetWidth / 2,
              bottom: provider.bottom - widget.dragWidgetHeight / 2,
              right: provider.right - widget.dragWidgetWidth / 2,
              child: Visibility(
                visible: provider.showDragWidgets,
                child: Stack(
                  children: [
                    // center: given full height an full width so the whole center can be selected and dragged
                    Align(
                      alignment: Alignment.center,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.move,
                        child: DragDistance(
                          onDrag: provider.onCenterDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: Container(
                            key:  provider.draggableKey,
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
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
                          child: widget.dragWidget,
                          onDrag: provider.onTopLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onTopCenterDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onTopRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onCenterLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onCenterRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onBottomLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onBottomCenterDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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
                          onDrag: provider.onBottomRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
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