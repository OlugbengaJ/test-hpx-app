import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/workspace/widgets/keyboard/keyboard_key.dart';

class KeyModel with ChangeNotifier {
  KeyModel({
    required this.keyRow,
    required this.keyCode,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    this.keyText,
    this.keyPathColors = const [Colors.red, Colors.white],
    this.keyTextColor = Colors.white,
    this.keyTextDirection = TextDirection.ltr,
    this.paintingStyle = PaintingStyle.stroke,
    this.keyLeft = 0,
    this.keyTop = 0,
  });

  /// keyRow indicates the row of the key
  /// e.g. keyRow = 1 means the key is on the first row i.e. function key row,
  /// keyRow = 2 means the key in on the second row.
  ///
  /// keyCode is fixed for each key regarless of language or text.
  final int keyRow;
  final String keyCode;

  String? keyText;
  List<Color>? keyPathColors;
  Color? keyTextColor;
  TextDirection? keyTextDirection;
  PaintingStyle paintingStyle;
  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;

  List<Color>? keyPathColorsBefore;
  PaintingStyle? paintingStyleBefore;

  /// [getRenderObject] gets the current [RenderObject] of the [KeyboardKey] widget.
  RenderBox? getRenderObject(BuildContext context) {
    return context.findRenderObject() as RenderBox?;
  }

  /// [shouldHighlight] indicates if [KeyModel] is under a selected zone or added by click.
  void shouldHighlight(Offset zoneOffset) {
    debugPrint('$keyCode highlighted');
    debugPrint('$keyCode parent offset $zoneOffset');

    if (keyPathColors != null) {
      keyPathColorsBefore = [...keyPathColors!];
      paintingStyleBefore = paintingStyle;
    }

    // highlight the color
    keyPathColors = [Colors.orange];
    paintingStyle = PaintingStyle.fill;

    notifyListeners();
  }
}
