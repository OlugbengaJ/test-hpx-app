import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect_clipper.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/key_rrect_painter.dart';
import 'package:hpx/providers/key_model.dart';

class KeyRRect extends StatelessWidget {
  /// [KeyRRect] returns a wrapped custom paint implementation for each key.
  const KeyRRect({
    Key? key,
    required this.keyModel,
    required this.zoomScale,
  }) : super(key: key);

  final KeyModel keyModel;
  final double zoomScale;

  @override
  Widget build(BuildContext context) {
    /// _width is used as a default canvas size factor whose value
    /// is determined from the scale of the original artwork (SVG) file.
    ///
    /// _zoomedWidth and _zoomedHeight define the canvas width and height
    /// based on the key width, height, and a zoom scale.
    const double _width = 800;
    final double _zoomedWidth = _width * keyModel.keyWidth * zoomScale;
    final double _zoomedHeight = _width * keyModel.keyHeight * zoomScale;

    return CustomPaint(
      size: Size(_zoomedWidth, _zoomedHeight * 0.298212833898266),
      painter: KeyRRectPainter(
        paintingStyle: keyModel.paintingStyle,
        keyText: keyModel.keyText,
        keyTextColor: keyModel.keyTextColor,
        keyTextDirection: keyModel.keyTextDirection,
        keyPathColors: keyModel.keyPathColors,
        zoomScale: zoomScale,
        clipper: KeyRRectClipper(
          keyLeft: keyModel.keyLeft * zoomScale,
          keyTop: keyModel.keyTop * zoomScale,
          keyRadius: keyModel.keyRadius,
          zoomScale: zoomScale,
        ),
      ),
    );
  }
}
