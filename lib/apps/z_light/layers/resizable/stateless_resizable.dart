import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/layers/resizable/drag_distance.dart';
import 'package:hpx/apps/z_light/layers/resizable/provider/resizable.dart';
import 'package:hpx/providers/layers_provider/layers.dart';
import 'package:provider/provider.dart';


class StatelessResizable extends StatelessWidget {
  const StatelessResizable({ 
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
  Widget build(BuildContext context) {
    _onDragEnd(ResizableProvider provider){
      LayersProvider layersProvider = context.read<LayersProvider>();
      provider.onDragEnd(layersProvider);
    }
    return Consumer<ResizableProvider>(
      builder: (_, provider, child_)
       {
        return Stack(
          children: <Widget>[
            Positioned(
              top: provider.top,
              left: provider.left,
              bottom: provider.bottom,
              right: provider.right,
              child: child,
            ),
            Positioned(
              top: provider.top - dragWidgetHeight / 2,
              left: provider.left - dragWidgetWidth / 2,
              bottom: provider.bottom - dragWidgetHeight / 2,
              right: provider.right - dragWidgetWidth / 2,
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
                          onDrag: provider.onTopLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // top center
                    Align(
                      alignment: Alignment.topCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUp,
                        child: DragDistance(                          
                          onDrag: provider.onTopCenterDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // top right
                    Align(
                      alignment: Alignment.topRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeUpRight,
                        child: DragDistance(                          
                          onDrag: provider.onTopRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // center left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeLeft,
                        child: DragDistance(                          
                          onDrag: provider.onCenterLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    
                    // center right
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeRight,
                        child: DragDistance(                          
                          onDrag: provider.onCenterRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // bottom left
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownLeft,
                        child: DragDistance(                          
                          onDrag: provider.onBottomLeftDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // bottom center
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDown,
                        child: DragDistance(                          
                          onDrag: provider.onBottomCenterDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
                        ),
                      ),
                    ),
                    // bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeDownRight,
                        child: DragDistance(                          
                          onDrag: provider.onBottomRightDrag,
                          onDragEnd: (DragEndDetails details){
                            _onDragEnd(provider);
                          },
                          child: dragWidget,
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