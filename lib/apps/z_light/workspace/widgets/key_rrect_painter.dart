import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Extends a custom painter to paint a key.
///
/// The painter will resize the canvas and clipper based on zoomScale.
class KeyRRectPainter extends CustomPainter {
  const KeyRRectPainter({
    Listenable? repaint,
    this.keyText,
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

  @override
  void paint(Canvas canvas, Size size) {
    final int pathColorsLength = keyPathColors.length;

    final Paint paint = Paint()
      // ..color = keyPathColor.withOpacity(1)
      // ..colorFilter = ColorFilter.mode(keyPathColors, BlendMode.luminosity)
      ..shader = ui.Gradient.radial(
        Offset.zero,
        size.width,
        // Offset(0, size.width),
        keyPathColors,
        keyPathColors.map((element) {
          return keyPathColors.indexOf(element) / (pathColorsLength - 1);
        }).toList(),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * zoomScale * 0.009211208 //0.0009211208
      ..strokeCap = StrokeCap.round;

    /// TextPainter draws the text on the key as long as a text is not empty
    ///
    if (keyText != null && keyText!.isNotEmpty) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: keyText,
          style: TextStyle(
            color: keyColor,
            fontSize: 8 * zoomScale,
          ),
        ),
        textDirection: TextDirection.ltr,
        locale: const Locale.fromSubtags(languageCode: 'fr'),
      );

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(canvas, Offset(4 * zoomScale, 1 * zoomScale));
    }

    RRect rrect = clipper.getClip(size).shift(Offset.zero);
    // canvas.clipRRect(rrect);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
