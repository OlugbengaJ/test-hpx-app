import 'package:flutter/material.dart';

class KeyRRectPainter extends CustomPainter {
  const KeyRRectPainter({
    Listenable? repaint,
    required this.clipper,
    required this.zoomScale,
  }) : super(repaint: repaint);

  final CustomClipper<RRect> clipper;
  final double zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 173, 50, 50).withOpacity(1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * zoomScale * 0.0009211208
      ..strokeCap = StrokeCap.round;

    RRect rrect = clipper.getClip(size).shift(Offset.zero);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
