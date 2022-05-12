import 'package:flutter/material.dart';
import 'package:hpx/widgets/components/zone_selector/zone_selector_provider.dart';
import 'package:provider/provider.dart';

class ZoneSelector extends StatelessWidget {
  ZoneSelector({
    Key? key,
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

  GlobalKey selectorWidegtKey = GlobalKey();

  _paintWidgets(provider) {
    for (var key in widgetsKeys) {
      provider.paintColor(key);
    }
  }

  _onPanStart(BuildContext context, DragStartDetails details, provider) {
    // Set the begining point the top, the bottom, the left, the right to 0.0
    RenderBox box = context.findRenderObject() as RenderBox;

    Offset localOffset = box.globalToLocal(details.globalPosition);
    double dx = localOffset.dx;
    double dy = localOffset.dy;

    double topPadding = details.globalPosition.dy - dy;
    double lefPadding = details.globalPosition.dx - dx;

    provider.setPaddings(topPadding, lefPadding);

    provider.setStartingPoint(dx, dy);
  }

  _onPanUpdate(BuildContext context, DragUpdateDetails details, provider) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset localOffset = box.globalToLocal(details.globalPosition);
    double dx = localOffset.dx;
    double dy = localOffset.dy;
    provider.startMoving(dx, dy);
  }

  _onPanEnd(BuildContext context, DragEndDetails details, provider) {
    provider.stopMoving(); // Call to set boxSize
    _paintWidgets(provider);
  }

  _onTapUp(BuildContext context, TapUpDetails details, provider) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset localOffset = box.globalToLocal(details.globalPosition);
    provider.onTap(localOffset.dx, localOffset.dy);
  }

  _getHighlightedZone(ZoneSelectorProvider provider) {
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
              onPanStart: (details) => _onPanStart(context, details, provider),
              onPanUpdate: (details) =>
                  _onPanUpdate(context, details, provider),
              onPanEnd: (details) => _onPanEnd(context, details, provider),
              onTapUp: (details) => _onTapUp(context, details, provider),
            ),
            Positioned(
              key: provider.selectorKey,
              top: provider.startingPoint.dy,
              left: provider.startingPoint.dx,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: borderColor,
                )),
                child: Opacity(
                  opacity: opacity,
                  child: GestureDetector(
                    onTapUp: (details) => _onTapUp(context, details, provider),
                    child: Container(
                      color:
                          provider.zoneSelecting ? color : Colors.transparent,
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
