// import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:hpx/providers/key_model.dart';

class KeyRRectPainter extends CustomPainter {
  /// [KeyRRectPainter] Extends a custom painter to paint a key.
  ///
  /// The painter uses the clipper to draw actual object on the canvas.
  const KeyRRectPainter({
    Listenable? repaint,
    required this.keyModel,
    required this.clipper,
    required this.zoomScale,
  }) : super(repaint: repaint);

  final CustomClipper<RRect> clipper;
  final KeyModel keyModel;
  final double zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    // const double defaultStrokeWidth = 50;
    // final int pathColorsLength = keyModel.keyPathColors.length;

    // final Paint paint = Paint()
    //   ..style = keyModel.paintingStyle
    //   ..strokeWidth = defaultStrokeWidth * zoomScale * 0.009211208
    //   ..strokeCap = StrokeCap.round;

    // /// use Paint.shader when multiple colors supplied, else set the color.
    // if (keyModel.keyPathColors.length > 1) {
    //   paint.shader = ui.Gradient.radial(
    //     Offset.zero,
    //     size.width,
    //     keyModel.keyPathColors,
    //     keyModel.keyPathColors.map((element) {
    //       return keyModel.keyPathColors.indexOf(element) /
    //           (pathColorsLength - 1);
    //     }).toList(),
    //   );
    // } else {
    //   Color keyPathColor = keyModel.keyPathColors.first;
    //   paint
    //     ..color = keyPathColor.withOpacity(1)
    //     ..colorFilter = ColorFilter.mode(keyPathColor, BlendMode.luminosity);
    // }

    // RRect rrect = clipper.getClip(size).shift(Offset.zero);

    // /// canvas.clipRRect(rrect) can be called for a more aggressive clip.
    // ///
    // /// However this was disabled because the left and bottom
    // /// of the key looked thiner than the top and right.

    // // canvas.clipRRect(rrect);
    // canvas.drawRRect(rrect, paint);

    for (var element in keyModel.chips) {
      switch (element.runtimeType) {
        case KeyPaintIcon:
          final iconPaint = element as KeyPaintIcon;
          if (iconPaint.paths != null) {
            final paint = Paint()..color = iconPaint.color;
            _clipCanvasToCenter(canvas, size);

            for (var e in iconPaint.paths!) {
              final path = _getIconPainter(e, size, zoomScale);
              canvas.drawPath(path, paint);
            }
          }
          break;
        case KeyPaintText:
          final textPaint =
              _getTextPainter(element as KeyPaintText, .3 * size.height);

          textPaint.layout(minWidth: 0, maxWidth: size.width);
          textPaint.paint(canvas, Offset(3 * zoomScale, 1 * zoomScale));
          break;
        case KeyPaintRect:
          final rectPaint = _getRectPainter(element as KeyPaintRect, zoomScale);
          RRect rrect = clipper.getClip(size).shift(Offset.zero);

          canvas.clipRRect(rrect);
          canvas.drawRRect(rrect, rectPaint);
          break;
        default:
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void _clipCanvasToCenter(Canvas canvas, Size size) {
  Path p = Path();
  p.moveTo(size.width * 0.2, size.height * 0.2);

  // create the square path to clip
  p.lineTo(size.width * 0.2, size.height * 0.2);
  p.lineTo(size.width * 0.2, size.height * 0.8);
  p.lineTo(size.width * 0.8, size.height * 0.8);
  p.lineTo(size.width * 0.8, size.height * 0.2);

  canvas.clipPath(p);
}

Path _getIconPainter(KeyIconPath keyIconPath, Size size, double zoomScale) {
  final path = Path();
  path.moveTo(
    keyIconPath.x * size.width,
    keyIconPath.y * size.height,
  );

  for (var keyIconCubic in keyIconPath.keyIconLines) {
    path.lineTo(
      keyIconCubic.x1 * size.width,
      keyIconCubic.y1 * size.height,
    );
  }

  return path;
}

/// [_getTextPainter] returns a [TextPainter] which draws a text on the key.
TextPainter _getTextPainter(KeyPaintText keyPaintText, double? fontSize) {
  return TextPainter(
    text: TextSpan(
      text: keyPaintText.text,
      style: TextStyle(
        color: keyPaintText.color,
        fontSize: fontSize,
      ),
    ),
    textDirection: keyPaintText.direction,
    locale: const Locale.fromSubtags(languageCode: 'en'),
  );
}

/// [_getRectPainter] draws a [RRect] to take a key shape.
Paint _getRectPainter(KeyPaintRect keyPaintRect, zoomScale) {
  return Paint()
    ..color = keyPaintRect.color.withOpacity(keyPaintRect.opacity)
    ..style = keyPaintRect.paintingStyle
    ..strokeWidth = keyPaintRect.strokeWidthFactor * zoomScale * 0.009211208
    ..strokeCap = keyPaintRect.strokeCap;
}
