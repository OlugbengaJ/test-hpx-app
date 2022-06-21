import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/draggable_region.dart';
import 'package:hpx/providers/workspace_provider.dart';
import 'package:provider/provider.dart';

class OverlaySelector extends StatelessWidget {
  const OverlaySelector({
    Key? key,
    this.overlayColor = Colors.blue,
    this.opacity = 0.4,
    this.showCrossHair = false,
    this.crossHairColor = Colors.white,
    this.isVisible = false,
    this.onPanDown,
    this.onPanUpdate,
    this.onPanEnd,
  }) : super(key: key);

  final Color overlayColor;
  final Color crossHairColor;

  final double opacity;
  final bool showCrossHair;

  final bool isVisible;

  final void Function(DragDownDetails, [DraggableRegionName])? onPanDown;
  final void Function(DragUpdateDetails, [DraggableRegionName])? onPanUpdate;
  final void Function(DragEndDetails details)? onPanEnd;

  @override
  Widget build(BuildContext context) {
    // opacity must be between 0 & 1 inclusive
    assert(opacity >= 0.0 && opacity <= 1.0);

    return Consumer<WorkspaceProvider>(
      builder: (context, value, child) => Visibility(
        visible: isVisible,
        child: Positioned(
          left: value.zoneL,
          top: value.zoneT,
          child: Container(
            margin: EdgeInsets.zero,
            width: value.zoneW,
            height: value.zoneH,
            decoration: BoxDecoration(
              color:
                  overlayColor.withOpacity(opacity * (showCrossHair ? 0.2 : 1)),
              border: getBorder,
            ),
            child: getCrossHair,
          ),
        ),
      ),
    );
  }

  final double crosshairSize = 5.0;
  BoxBorder? get getBorder {
    if (!showCrossHair) return null;
    return Border.all(width: 0.5, color: crossHairColor);
  }

  Widget? get getCrossHair {
    // return crosshair controls only when crosshair is true
    if (!showCrossHair) return null;

    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.center,
          child: DraggableRegion(
            name: DraggableRegionName.center,
            color: Colors.transparent,
            cursor: SystemMouseCursors.move,
            onPanDown: onPanDown,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: DraggableRegion(
            name: DraggableRegionName.topLeft,
            color: crossHairColor,
            cursor: SystemMouseCursors.resizeUpLeftDownRight,
            width: crosshairSize,
            height: crosshairSize,
            onPanDown: onPanDown,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: DraggableRegion(
            name: DraggableRegionName.topRight,
            color: crossHairColor,
            cursor: SystemMouseCursors.resizeDownLeft,
            width: crosshairSize,
            height: crosshairSize,
            onPanDown: onPanDown,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: DraggableRegion(
            name: DraggableRegionName.bottomLeft,
            color: crossHairColor,
            cursor: SystemMouseCursors.resizeUpRight,
            width: crosshairSize,
            height: crosshairSize,
            onPanDown: onPanDown,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: DraggableRegion(
            name: DraggableRegionName.bottomRight,
            color: crossHairColor,
            cursor: SystemMouseCursors.resizeUpLeftDownRight,
            width: crosshairSize,
            height: crosshairSize,
            onPanDown: onPanDown,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
          ),
        ),
      ],
    );
  }
}
