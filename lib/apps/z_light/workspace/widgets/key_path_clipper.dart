import 'package:flutter/material.dart';

class KeyPathClipper extends CustomClipper<Path> {
  const KeyPathClipper({Listenable? reclip, required this.zoomScale})
      : super(reclip: reclip);

  final double zoomScale;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, -0.02);
    path.cubicTo(
      0,
      -0.02,
      size.width,
      -0.02,
      size.width,
      -0.02,
    );
    path.cubicTo(
      size.width,
      -0.02,
      size.width,
      size.height * 0.52,
      size.width,
      size.height * 0.52,
    );
    path.cubicTo(
      size.width,
      size.height * 0.52,
      0,
      size.height * 0.52,
      0,
      size.height * 0.52,
    );
    path.cubicTo(
      0,
      size.height * 0.52,
      0,
      -0.02,
      0,
      -0.02,
    );

    // path.moveTo(1060.7023 * zoomScale, 962.80119 * zoomScale);
    // path.cubicTo(
    //   300 * zoomScale,
    //   12.492361 * zoomScale,
    //   95.567398 * zoomScale,
    //   692.82202 * zoomScale,
    //   210.658491 * zoomScale,
    //   -16.91273 * zoomScale,
    // );

    // path.cubicTo(
    //   119.396 * zoomScale,
    //   178.385 * zoomScale,
    //   142.116 * zoomScale,
    //   203.325 * zoomScale,
    //   166.569 * zoomScale,
    //   220.764 * zoomScale,
    // );

    // path.cubicTo(
    //   190.591 * zoomScale,
    //   237.895 * zoomScale,
    //   218.969 * zoomScale,
    //   250.109 * zoomScale,
    //   235.467 * zoomScale,
    //   275.895 * zoomScale,
    // );
    // path.cubicTo(
    //   251.907 * zoomScale,
    //   301.59 * zoomScale,
    //   251.874 * zoomScale,
    //   333.261 * zoomScale,
    //   257.411 * zoomScale,
    //   362.746 * zoomScale,
    // );
    // path.cubicTo(
    //   262.655 * zoomScale,
    //   390.668 * zoomScale,
    //   268.591 * zoomScale,
    //   418.289 * zoomScale,
    //   267.371 * zoomScale,
    //   445.781 * zoomScale,
    // );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
