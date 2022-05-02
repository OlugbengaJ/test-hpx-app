import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Extends a custom painter to paint a key.
///
/// The painter will resize the canvas and clipper based on zoomScale.
class KeyRRectPainter extends CustomPainter {
  const KeyRRectPainter({
    Listenable? repaint,
    this.keyText,
    required this.paintingStyle,
    required this.keyPathColors,
    required this.keyColor,
    required this.clipper,
    required this.zoomScale,
  }) : super(repaint: repaint);

  final CustomClipper<RRect> clipper;

  final String? keyText;
  final List<Color> keyPathColors;
  final Color keyColor;

  final double zoomScale;
  final PaintingStyle paintingStyle;

  @override
  void paint(Canvas canvas, Size size) {
    const double _defaultStrokeWidth = 50;
    final int _pathColorsLength = keyPathColors.length;

    final Paint paint = Paint()
      // ..color = keyPathColor.withOpacity(1)
      // ..colorFilter = ColorFilter.mode(keyPathColors, BlendMode.luminosity)
      ..shader = ui.Gradient.radial(
        Offset.zero,
        size.width,
        keyPathColors,
        keyPathColors.map((element) {
          return keyPathColors.indexOf(element) / (_pathColorsLength - 1);
        }).toList(),
      )
      ..style = paintingStyle
      ..strokeWidth =
          _defaultStrokeWidth * zoomScale * 0.009211208 //0.0009211208
      ..strokeCap = StrokeCap.round;

    RRect rrect = clipper.getClip(size).shift(Offset.zero);
    // canvas.clipRRect(rrect);
    canvas.drawRRect(rrect, paint);

    /// TextPainter draws the text on the key as long as text is not empty.
    ///
    /// The text should be painted after the key to ensure it's up.
    if (keyText != null && keyText!.isNotEmpty) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: keyText,
          style: TextStyle(
            color: keyColor,
            fontSize: .23 * size.height * zoomScale,
          ),
        ),
        textDirection: TextDirection.ltr,
        locale: const Locale.fromSubtags(languageCode: 'fr'),
      );

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(canvas, Offset(3 * zoomScale, 1 * zoomScale));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
