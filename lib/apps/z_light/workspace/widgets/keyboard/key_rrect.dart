import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect_clipper.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect_painter.dart';

class KeyRRect extends StatelessWidget {
  const KeyRRect({
    Key? key,
    this.keyText,
    this.keyTextColor,
    this.keyTextDirection,
    required this.paintingStyle,
    required this.keyPathColors,
    required this.keyLeft,
    required this.keyTop,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    required this.zoomScale,
  }) : super(key: key);

  final String? keyText;
  final Color? keyTextColor;
  final TextDirection? keyTextDirection;
  final List<Color> keyPathColors;
  final PaintingStyle paintingStyle;

  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    /// _width is used as a default canvas size factor whose value
    /// is determined from the scale of the original artwork (SVG) file.
    ///
    /// _zoomedWidth and _zoomedHeight define the canvas width and height
    /// based on the key width, height, and a zoom scale.
    const double _width = 800;
    final double _zoomedWidth = _width * keyWidth * zoomScale;
    final double _zoomedHeight = _width * keyHeight * zoomScale;

    return CustomPaint(
      size: Size(_zoomedWidth, _zoomedHeight * 0.298212833898266),
      painter: KeyRRectPainter(
        paintingStyle: paintingStyle,
        keyText: keyText,
        keyTextColor: keyTextColor,
        keyTextDirection: keyTextDirection,
        keyPathColors: keyPathColors,
        zoomScale: zoomScale,
        clipper: KeyRRectClipper(
          keyLeft: keyLeft,
          keyTop: keyTop,
          keyRadius: keyRadius,
          zoomScale: zoomScale,
        ),
      ),
    );
  }
}
