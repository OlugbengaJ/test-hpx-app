import 'package:flutter/material.dart';

class KeyRRectClipper extends CustomClipper<RRect> {
  /// [KeyRRectClipper] handles the clipping of the keyboard key on canvas.
  const KeyRRectClipper({
    Listenable? reclip,
    required this.zoomScale,
    required this.keyLeft,
    required this.keyTop,
    required this.keyRadius,
  }) : super(reclip: reclip);

  final double zoomScale;
  final double keyLeft;
  final double keyTop;
  final double keyRadius;

  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width * keyLeft,
        size.height * keyTop,
        size.width,
        size.height,
      ),
      bottomRight: Radius.circular(zoomScale * size.width * keyRadius),
      bottomLeft: Radius.circular(zoomScale * size.width * keyRadius),
      topLeft: Radius.circular(zoomScale * size.width * keyRadius),
      topRight: Radius.circular(zoomScale * size.width * keyRadius),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}
