import 'package:flutter/material.dart';

class KeyboardProvider extends ChangeNotifier {
  final List<KeyModel> _keys = [];

  List<KeyModel> get keys => _keys;

  /// Add a new [key]
  void add(KeyModel key) {
    if (_keys.isEmpty ||
        _keys.any((element) => element.keyCode != key.keyCode)) {
      _keys.add(key);

      // This call tells widgets listening to this model to rebuild.
      notifyListeners();
    }
  }

  /// Replaces an existing [key]
  void replace(KeyModel key) {
    int keyIndex =
        _keys.indexWhere((element) => element.keyCode == key.keyCode);
    _keys.removeAt(keyIndex);
    _keys.insert(keyIndex, key);

    // This call tells widgets listening to this model to rebuild.
    notifyListeners();
  }
}

class KeyModel {
  const KeyModel({
    required this.keyCode,
    required this.keyText,
    this.keyPathColors = const [Colors.red, Colors.white],
    this.keyTextColor = Colors.white,
    this.keyTextDirection = TextDirection.ltr,
    this.paintingStyle = PaintingStyle.stroke,
    this.keyLeft = 0,
    this.keyTop = 0,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    // required this.zoomScale,
  });

  final String keyCode;
  final String keyText;
  final List<Color>? keyPathColors;
  final Color? keyTextColor;
  final TextDirection? keyTextDirection;
  final PaintingStyle paintingStyle;
  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;
  // final double zoomScale;
}
