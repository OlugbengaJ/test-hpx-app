import 'package:flutter/material.dart';

class KeyPathPainter extends CustomPainter {
  const KeyPathPainter({Listenable? repaint, required this.clipper})
      : super(repaint: repaint);

  final CustomClipper<Path> clipper;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0;

    Path path = clipper.getClip(size).shift(Offset.zero);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  // @override
  // bool hitTest(Offset position) {
  //   return path.contains(position);
  // }
}
