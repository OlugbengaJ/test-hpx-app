import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DraggableRegion extends StatelessWidget {
  const DraggableRegion({
    Key? key,
    required this.name,
    required this.cursor,
    this.color,
    this.width,
    this.height,
    this.onPanDown,
    this.onPanUpdate,
    this.onPanEnd,
  }) : super(key: key);

  final DraggableRegionName name;
  final SystemMouseCursor cursor;

  final Color? color;
  final double? width;
  final double? height;
  // final double maxWidth;
  // final double maxHeight;

  final void Function(DragDownDetails, DraggableRegionName)? onPanDown;
  final void Function(DragUpdateDetails, DraggableRegionName)? onPanUpdate;
  final void Function(DragEndDetails details)? onPanEnd;

  double? getValue(double? v, double max) {
    if (v == null) return v;

    // return max when v is less than max
    if (v < max) return max;

    return v;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      child: GestureDetector(
        onPanDown:
            onPanDown == null ? null : (details) => onPanDown!(details, name),
        onPanUpdate: onPanUpdate == null
            ? null
            : (details) => onPanUpdate!(details, name),
        onPanEnd: onPanEnd == null ? null : (details) => onPanEnd!(details),
        child: Container(
          color: color,
          width: width,
          height: height,
        ),
      ),
    );
  }
}

enum DraggableRegionName {
  bottomLeft,
  bottomRight,
  center,
  topLeft,
  topRight,
}
