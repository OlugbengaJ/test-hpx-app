import 'package:flutter/material.dart';

class KeyModel with ChangeNotifier {
  KeyModel({
    required this.keyRow,
    required this.keyCode,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    this.keyText,
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
  Color? keyTextColor;
  TextDirection? keyTextDirection;
  PaintingStyle paintingStyle;
  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;

  static const Color _highlightColor = Colors.orange;

  List<Color> _keyPathColors = [Colors.red, Colors.white];
  List<Color>? _keyPathColorsBefore;
  PaintingStyle? _paintingStyleBefore;

  /// [isSelected] indicates key is selected.
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  /// [keyPathColors] returns the list of colors for the key
  List<Color> get keyPathColors => [..._keyPathColors];

  /// [setPathColors] replaces colors of [_keyPathColors].
  void setPathColors(List<Color> colors) {
    _keyPathColors = [...colors];
  }

  /// [selectKey] indicates if [KeyModel] is under a selected zone
  /// or added by clicking the widget.
  void selectKey(bool? isHighlighted) {
    if (isHighlighted == true) {
      // save previous key settings if null
      if (_keyPathColorsBefore == null) {
        _keyPathColorsBefore = [..._keyPathColors];
        _paintingStyleBefore = paintingStyle;
      }

      // highlight the key
      _isSelected = true;
      paintingStyle = PaintingStyle.fill;
      _keyPathColors = [_highlightColor];
    } else if (isHighlighted == false) {
      _isSelected = false;

      // highlight not done, so retrieve previous key color and paint style
      if (_keyPathColorsBefore != null && _paintingStyleBefore != null) {
        _keyPathColors = [..._keyPathColorsBefore!];
        paintingStyle = _paintingStyleBefore!;
      }
    }
  }

  /// [unSelectKey] restore [KeyModel] previous settings.
  void unSelectKey() {
    // restore previous key settings
    if (_keyPathColorsBefore != null) {
      _isSelected = false;
      _keyPathColors = [..._keyPathColorsBefore!];
      paintingStyle = _paintingStyleBefore!;
    }
  }
}