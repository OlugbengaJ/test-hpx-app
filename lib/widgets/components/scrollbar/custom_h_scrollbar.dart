import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/globals.dart';
import 'package:hpx/apps/z_light/workspace/widgets/draggable_region.dart';

class CustomHScrollbar extends StatelessWidget {
  /// [CustomHScrollbar] creates a horizontal scrollbar.
  /// Only two out of the three values ([start], [end]) set the length,
  /// while [bottom] sets the vertical position of the scrollbar.
  /// The height of the scrollbar and icons is defined by [buttonSize].
  const CustomHScrollbar({
    Key? key,
    this.start,
    this.end,
    this.bottom,
    this.buttonSize,
    this.thumbSize,
    this.thumbOffset,
    required this.primaryColor,
    this.secondaryColor,
    this.onPanHorizontal,
  }) : super(key: key);

  final double? start;
  final double? end;
  final double? bottom;
  final double? buttonSize;
  final double? thumbSize;
  final double? thumbOffset;
  final Color? primaryColor;
  final Color? secondaryColor;

  // final void Function(DragDownDetails, DraggableRegionName)? onPanDown;
  final void Function(DragUpdateDetails, DraggableRegionName)? onPanHorizontal;
  // final void Function(DragEndDetails details)? onPanEnd;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: start,
      end: end,
      bottom: bottom,
      child: Container(
        margin: EdgeInsets.zero,
        color: secondaryColor,
        height: buttonSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(
            //   width: size,
            //   height: size,
            //   child:
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_left, size: buttonSize),
                ),
              ),
            ),
            // ),
            Expanded(
              key: hScrollbarKey,
              child: Stack(
                children: [
                  Positioned(
                    left: thumbOffset,
                    child: DraggableRegion(
                      name: DraggableRegionName.center,
                      cursor: SystemMouseCursors.grab,
                      color: primaryColor,
                      width: thumbSize,
                      height: buttonSize,
                      onPanUpdate: onPanHorizontal,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: size,
            //   height: size,
            //   child:
            Material(
              child: Ink(
                color: primaryColor,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Icon(Icons.arrow_right, size: buttonSize),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
