import 'dart:ui' as ui;
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
    const double defaultStrokeWidth = 50;
    final int pathColorsLength = keyModel.keyPathColors.length;

    final Paint paint = Paint()
      ..style = keyModel.paintingStyle
      ..strokeWidth = defaultStrokeWidth * zoomScale * 0.009211208
      ..strokeCap = StrokeCap.round;

    /// use Paint.shader when multiple colors supplied, else set the color.
    if (keyModel.keyPathColors.length > 1) {
      paint.shader = ui.Gradient.radial(
        Offset.zero,
        size.width,
        keyModel.keyPathColors,
        keyModel.keyPathColors.map((element) {
          return keyModel.keyPathColors.indexOf(element) /
              (pathColorsLength - 1);
        }).toList(),
      );
    } else {
      Color keyPathColor = keyModel.keyPathColors.first;
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

    #region;
    // multiple layer
    paint.color = Colors.green.withOpacity(1);
    canvas.drawRRect(rrect, paint);
    #endregion;

    /// TextPainter draws the text on the key as long as text is not empty.
    ///
    /// The text should be painted after the key to ensure it's displayed.
    if (keyModel.keyText != null && keyModel.keyText!.isNotEmpty) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: keyModel.keyText,
          style: TextStyle(
            color: keyModel.keyTextColor,
            fontSize: .3 * size.height,
          ),
        ),
        textDirection: keyModel.keyTextDirection,
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
