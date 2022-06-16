import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/overlay_selector.dart';

class CustomHScrollbar extends StatelessWidget {
  /// [CustomHScrollbar] creates a horizontal scrollbar.
  /// Only two out of the three values ([start], [end]) set the length,
  /// while [bottom] sets the vertical position of the scrollbar.
  /// The height of the scrollbar and icons is defined by [size].
  const CustomHScrollbar({
    Key? key,
    this.start,
    this.end,
    this.bottom,
    this.size,
    this.trackSize,
    required this.primaryColor,
    this.secondaryColor,
    this.onDragHandler,
  }) : super(key: key);

  final double? start;
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
      start: start,
      end: end,
      bottom: bottom,
      child: Container(
        margin: EdgeInsets.zero,
        color: secondaryColor,
        // height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_left, size: size),
                ),
              ),
            ),
            DraggableRegion(
              name: DraggableRegionName.center,
              cursor: SystemMouseCursors.grab,
              color: primaryColor,
              width: trackSize,
              height: size,
              onPanDown: (details, name) =>
                  debugPrint('hS down $name $details'),
              onPanUpdate: (details, name) =>
                  debugPrint('hS update $name $details'),
              onPanEnd: (details) => debugPrint('hS end $details'),
            ),
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_right, size: size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
