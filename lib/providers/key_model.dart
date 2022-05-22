import 'package:flutter/material.dart';

class KeyModel with ChangeNotifier {
  KeyModel({
    required this.keyRow,
    required this.keyCode,
    required this.keyWidth,
    required this.keyHeight,
    required this.keyRadius,
    this.keyLeft = 0,
    this.keyTop = 0,
  });

  /// [keyRow] indicates the row of the key
  ///
  /// e.g. keyRow = 1 means the key is on the first row i.e. function key row,
  /// keyRow = 2 means the key in on the second row.
  final int keyRow;

  /// [keyCode] is fixed for each key regarless of language or text.
  final String keyCode;

  /// [_chips] holds multiple layers of the key
  /// e.g. a key could have a base color, layers with unique colors and IDs,
  /// and a text or icon layer.
  ///
  /// Each layer of the chip will be rendered from first to last.
  final List<KeyPaintChip> _chips = [KeyPaintRect()];

  /// [chips] returns the children of [_chips] as a new list.
  List<KeyPaintChip> get chips => [..._chips];

  /// [addChipText] adds a text layer to chips.
  void addChipText(String keyText,
      {Color? color, TextDirection? textDirection}) {
    final text = KeyPaintText(textValue: keyText);

    if (color != null) text.color = color;
    if (textDirection != null) text.direction = textDirection;

    _chips.add(text);
  }

  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;

  static const Color _highlightColor = Colors.orange;

  /// [isSelected] indicates key is selected.
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  /// [getChip] returns a chip with matching [id].
  KeyPaintChip? getChip(int id) {
    try {
      return _chips.firstWhere((element) => element.id == 2);
    }
    // chip not found, return null.
    on StateError {
      return null;
    }
  }

  /// [addOrUpdateChip] adds or updates the state of a chip in [chips].
  void addOrUpdateChip(int id) {
    KeyPaintChip? chip = getChip(id);

    if (chip == null) {
      chip = KeyPaintRect()..id = id;

      // TODO: refactor to use map with keys
      int index = _chips.indexWhere((element) => element.isOverlay);
      if (index == -1) index = _chips.length; // index is last in list.
      _chips.insert(index, chip);
    }

    chip.color = _highlightColor;
  }

  /// [removeChip] deletes chip layer that matches [id].
  void removeChip(int id) {
    _chips.removeWhere((element) => element.id == id);
  }

  /// [selectKey] highlights [KeyModel] under a selected zone.
  void selectKey(bool? isHighlighted, int id) {
    if (isHighlighted == true) {
      // highlight the key i.e. inject a new chip with specific id
      _isSelected = true;
      addOrUpdateChip(id);
      debugPrint('$keyCode ${chips.length}');
    } else if (isHighlighted == false) {
      // remove chip with specific id
      _isSelected = false;
      removeChip(id);
    }
  }

  // /// [clearKeys] restore [KeyModel] previous settings.
  // void clearKeys() {
  //   // restore base key settings i.e. remove chip.id if exists.
  //   _isSelected = false;
  //   getBase().color = Colors.black;
  // }
}

mixin KeyPaintChip {
  int? id;
  late Color color;
  late bool isOverlay;
}

class KeyPaintText with KeyPaintChip {
  /// [KeyPaintText] intended to draw text on a canvas.
  KeyPaintText({
    Color textColor = Colors.white,
    TextDirection textDirection = TextDirection.ltr,
    String? textValue,
  }) {
    color = textColor;
    direction = textDirection;
    text = textValue;
    isOverlay = true;
  }

  String? text;
  late TextDirection direction;
}

class KeyPaintRect with KeyPaintChip {
  /// [KeyPaintRect] intended to draw a RRect on a canvas.
  KeyPaintRect({
    Color rectColor = Colors.black,
    double rectOpacity = 1.0,
    PaintingStyle rectPaintingStyle = PaintingStyle.fill,
    StrokeCap rectStrokeCap = StrokeCap.round,
    StrokeJoin rectStrokeJoin = StrokeJoin.round,
    double rectStrokeWidthFactor = 50,
  }) {
    isOverlay = false;
    color = rectColor;
    opacity = rectOpacity;
    paintingStyle = rectPaintingStyle;
    strokeCap = rectStrokeCap;
    strokeJoin = rectStrokeJoin;
    strokeWidthFactor = rectStrokeWidthFactor;
  }

  late double opacity;
  late PaintingStyle paintingStyle;
  late StrokeCap strokeCap;
  late StrokeJoin strokeJoin;
  late double strokeWidthFactor;
}
