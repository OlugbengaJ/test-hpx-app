import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/key_path_painter.dart';

class KeyPath extends StatelessWidget {
  const KeyPath({Key? key, required this.clipper, required this.child})
      : super(key: key);

  final CustomClipper<Path> clipper;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: KeyPathPainter(
        clipper: clipper,
      ),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
