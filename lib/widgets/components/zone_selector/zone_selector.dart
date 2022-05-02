import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'zone_selector_provider.dart';

class ZoneSelector extends StatefulWidget {
  const ZoneSelector({ Key? key,
    required this.getSize,
    required this.widgetsKeys,
    this.showBorderOnMouseMoving = false,
    this.paintOnMouseMoving = true,
    this.showBorderOnMouseStop = false,
    this.paintOnMouseStop = true,
    this.color = Colors.blue,
    this.borderColor = Colors.transparent,
    this.opacity = 0.2,
    
  }) : super(key: key);
  final bool showBorderOnMouseMoving;
  final bool paintOnMouseMoving;
  final bool showBorderOnMouseStop;
  final bool paintOnMouseStop;
  final Color color;
  final Color borderColor;
  final double opacity;
  final List<GlobalKey> widgetsKeys;
  final void Function(Size size) getSize;  // Will assign the size
  

  @override
  State<ZoneSelector> createState() => _ZoneSelectorState();
}

class _ZoneSelectorState extends State<ZoneSelector> {
  final selectorWidegtKey = GlobalKey();
  late DragUpdateDetails lastDetails;
  double dx = 0;
  double dy = 0;
  

  @override
  void initState() {
    super.initState();    
  }

  _paintWidgets(provider){ 
    for(var key in widget.widgetsKeys){
      provider.paintColor(key);
    }
  }

  _onPanStart(DragStartDetails details, provider){ // Set the begining point the top, the bottom, the left, the right to 0.0
    RenderBox box = context.findRenderObject() as RenderBox;
    
    
    Offset localOffset = box.globalToLocal(details.globalPosition);
    double dx = localOffset.dx;
    double dy = localOffset.dy;

    double topPadding = details.globalPosition.dy - dy;
    double lefPadding = details.globalPosition.dx - dx;

    provider.setPaddings(topPadding, lefPadding);

    provider.setStartingPoint(dx, dy);

  }
 
  _onPanUpdate(DragUpdateDetails details, provider){
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset localOffset = box.globalToLocal(details.globalPosition);
    double dx = localOffset.dx;
    double dy = localOffset.dy;
    provider.startMoving(dx, dy);
    
  }


  _onPanEnd(DragEndDetails details, provider){
    provider.stopMoving(); // Call to set boxSize
    widget.getSize(provider.boxSize);
    _paintWidgets(provider);
    
  }

  _onTapUp(TapUpDetails details, provider){
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset localOffset = box.globalToLocal(details.globalPosition);
    provider.onTap(localOffset.dx, localOffset.dy);
  }


  _getHighlightedZone(ZoneSelectorProvider provider){
    List<Widget> zones = [];
    for (var item in provider.zoneToPaint) {
      zones.add(
        Positioned(
          top: item['position'].dy,
          left: item['position'].dx,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              height: item['size'].height,
              width: item['size'].width,
              color: Colors.yellow,
            ),
          ),
        ),
      );
    }

    return zones;
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ZoneSelectorProvider>(
      builder: (_, provider, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (details) => _onPanStart(details, provider),
              onPanUpdate: (details) => _onPanUpdate(details, provider),
              onPanEnd: (details) => _onPanEnd(details, provider),
              onTapUp: (details)=> _onTapUp(details, provider),
            ),
            Positioned(
              key: provider.selectorKey,
              top: provider.startingPoint.dy,
              left: provider.startingPoint.dx,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.borderColor,
                  )
                ),
                child: Opacity(
                  opacity: widget.opacity,
                  child: GestureDetector(
                    onTapUp: (details)=> _onTapUp(details, provider),
                    child: Container(
                      color: provider.zoneSelecting? widget.color: Colors.transparent,
                      height: provider.height,
                      width: provider.width,
                    ),
                  ),
                ),
              ),
            ),

            Stack(
              children: _getHighlightedZone(provider),
            )
          ],
        );
      },
    );
  }
}