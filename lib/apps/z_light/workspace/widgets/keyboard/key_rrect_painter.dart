import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class KeyRRectPainter extends CustomPainter {
  /// [KeyRRectPainter] Extends a custom painter to paint a key.
  ///
  /// The painter uses the clipper to draw actual object on the canvas.
  const KeyRRectPainter({
    Listenable? repaint,
    this.keyText,
    this.keyTextColor,
    this.keyTextDirection,
    required this.paintingStyle,
    required this.keyPathColors,
    required this.clipper,
    required this.zoomScale,
  }) : super(repaint: repaint);

  final CustomClipper<RRect> clipper;

  final String? keyText;
  final Color? keyTextColor;
  final TextDirection? keyTextDirection;
  final List<Color> keyPathColors;

  final double zoomScale;
  final PaintingStyle paintingStyle;

  @override
  void paint(Canvas canvas, Size size) {
    const double _defaultStrokeWidth = 50;
    final int _pathColorsLength = keyPathColors.length;

    final Paint paint = Paint()
      ..style = paintingStyle
      ..strokeWidth = _defaultStrokeWidth * zoomScale * 0.009211208
      ..strokeCap = StrokeCap.round;

    /// use Paint.shader when multiple colors supplied, else set the color.
    if (keyPathColors.length > 1) {
      paint.shader = ui.Gradient.radial(
        Offset.zero,
        size.width,
        keyPathColors,
        keyPathColors.map((element) {
          return keyPathColors.indexOf(element) / (_pathColorsLength - 1);
        }).toList(),
      );
    } else {
      Color keyPathColor = keyPathColors.first;
      paint
        ..color = keyPathColor.withOpacity(1)
        ..colorFilter = ColorFilter.mode(keyPathColor, BlendMode.luminosity);
    }

    RRect rrect = clipper.getClip(size).shift(Offset.zero);

    /// canvas.clipRRect(rrect) can be called for a more aggressive clip.
    ///
    /// However this was disabled because the left and bottom
    /// of the key looked thiner than the top and right.
    // canvas.clipRRect(rrect);
    canvas.drawRRect(rrect, paint);

    /// TextPainter draws the text on the key as long as text is not empty.
    ///
    /// The text should be painted after the key to ensure it's displayed.
    if (keyText != null && keyText!.isNotEmpty) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: keyText,
          style: TextStyle(
            color: keyTextColor,
            fontSize: .3 * size.height,
          ),
        ),
        textDirection: keyTextDirection,
        locale: const Locale.fromSubtags(languageCode: 'en'),
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
