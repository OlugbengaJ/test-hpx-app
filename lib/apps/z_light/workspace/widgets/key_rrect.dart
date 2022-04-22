import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_rrect_painter.dart';

class KeyRRect extends StatelessWidget {
  const KeyRRect({
    Key? key,
    required this.clipper,
    this.zoomScale = 1,
    this.child,
  }) : super(key: key);

  final CustomClipper<RRect> clipper;
  final double zoomScale;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double _width = 800;

    return CustomPaint(
      size: Size(_width * zoomScale, (_width * 0.298212833898266).toDouble()),
      painter: KeyRRectPainter(
        clipper: clipper,
        zoomScale: zoomScale,
      ),
      // child: child,
    );
  }
}
