import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/overlay_selector.dart';

class CustomVScrollbar extends StatelessWidget {
  /// [CustomVScrollbar] creates a vertical scrollbar.
  /// Only two out of the three values ([top], [bottom]) set the height,
  /// while [end] sets the horizontal position of the scrollbar.
  /// The width of the scrollbar and icons is defined by [size].
  const CustomVScrollbar({
    Key? key,
    this.top,
    this.end,
    this.bottom,
    this.size,
    this.trackSize,
    this.primaryColor,
    this.secondaryColor,
    this.onDragHandler,
  }) : super(key: key);

  final double? top;
  final double? end;
  final double? bottom;
  final double? size;
  final double? trackSize;
  final Color? primaryColor;
  final Color? secondaryColor;

  final VoidCallback? onDragHandler;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: top,
      end: end,
      bottom: bottom,
      child: Container(
        margin: EdgeInsets.zero,
        color: secondaryColor,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_drop_up, size: size),
                ),
              ),
            ),
            DraggableRegion(
              name: DraggableRegionName.center,
              cursor: SystemMouseCursors.grabbing,
              color: primaryColor,
              width: size,
              height: trackSize,
              onPanDown: (details, name) =>
                  debugPrint('vS down $name $details'),
              onPanUpdate: (details, name) =>
                  debugPrint('vS update $name $details'),
              onPanEnd: (details) => debugPrint('vS end $details'),
            ),
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: size,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
