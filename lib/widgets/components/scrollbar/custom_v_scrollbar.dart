import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/workspace/widgets/draggable_region.dart';

class CustomVScrollbar extends StatelessWidget {
  /// [CustomVScrollbar] creates a vertical scrollbar.
  /// Only two out of the three values ([top], [bottom]) set the height,
  /// while [end] sets the horizontal position of the scrollbar.
  /// The width of the scrollbar and icons is defined by [buttonSize].
  const CustomVScrollbar({
    Key? key,
    this.top,
    this.end,
    this.bottom,
    this.buttonSize,
    this.thumbSize,
    this.thumbOffset,
    required this.primaryColor,
    this.secondaryColor,
    this.onPanVertical,
  }) : super(key: key);

  final double? top;
  final double? end;
  final double? bottom;
  final double? buttonSize;
  final double? thumbSize;
  final double? thumbOffset;
  final Color? primaryColor;
  final Color? secondaryColor;

  // final void Function(DragDownDetails, DraggableRegionName)? onPanDown;
  final void Function(DragUpdateDetails, DraggableRegionName)? onPanVertical;
  // final void Function(DragEndDetails details)? onPanEnd;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: top,
      end: end,
      bottom: bottom,
      child: Container(
        margin: EdgeInsets.zero,
        color: secondaryColor,
        width: buttonSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // up scroll button
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_drop_up, size: buttonSize),
                ),
              ),
            ),

            // thumb scroll
            Expanded(
              key: vScrollbarKey,
              child: Stack(
                children: [
                  Positioned(
                    top: thumbOffset,
                    child: DraggableRegion(
                      name: DraggableRegionName.center,
                      cursor: SystemMouseCursors.grabbing,
                      color: primaryColor,
                      width: buttonSize,
                      height: thumbSize,
                      onPanUpdate: onPanVertical,
                    ),
                  ),
                ],
              ),
            ),

            // down scroll button
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: buttonSize,
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
