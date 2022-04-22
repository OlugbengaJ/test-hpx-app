import 'package:flutter/material.dart';

class KeyRRectClipper extends CustomClipper<RRect> {
  const KeyRRectClipper({Listenable? reclip, required this.zoomScale})
      : super(reclip: reclip);

  final double zoomScale;

  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width * 0.01795162,
        size.height * 0.003479,
        zoomScale * size.width * 0.03914955,
        zoomScale * size.height * 0.1312806,
      ),
      bottomRight: Radius.circular(zoomScale * size.width * 0.001594051),
      bottomLeft: Radius.circular(zoomScale * size.width * 0.001594051),
      topLeft: Radius.circular(zoomScale * size.width * 0.001594051),
      topRight: Radius.circular(zoomScale * size.width * 0.001594051),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}
