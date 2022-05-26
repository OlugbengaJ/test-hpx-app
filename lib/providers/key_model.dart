import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';

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

  /// [keyCode] uniquely identifies a key and is fixed regarless of language.
  final KeyCode keyCode;

  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;

  static final Color _highlightColor = colorRandom; //Colors.orange;

  /// [_isSelected] indicates key is selected.
  bool _isSelected = false;
  bool get isSelected => _isSelected;

  /// [_chips] holds multiple layers of a key
  /// e.g. a key could have only 1 base color, multiple layers with unique keys,
  /// and only 1 overlay (text or icon layer).
  ///
  /// Each layer of the chip will be rendered from first to last and by default,
  /// a chip is initialized with a [KeyPaintRect] base.
  final Map<String, KeyPaintChip> _chips = {
    ChipKey.base.toString(): KeyPaintRect(),
  };

  /// [chips] returns the values of [_chips] as a new list.
  List<KeyPaintChip> get chips => [..._chips.values];

  /// [addChipIcon] adds an icon layer to chips.
  void addChipIcon(
    List<KeyIconPath>? iconPath, {
    Color? color,
  }) {
    final icon = KeyPaintIcon(pathsValue: iconPath);

    if (color != null) icon.color = color;

    addChip(ChipKey.overlay.toString(), icon);
  }

  /// [addChipText] adds a text layer to chips.
  void addChipText(
    String keyText, {
    Color? color,
    TextDirection? textDirection,
  }) {
    final text = KeyPaintText(textValue: keyText);

    if (color != null) text.color = color;
    if (textDirection != null) text.direction = textDirection;

    addChip(ChipKey.overlay.toString(), text);
  }

  /// [addChip] adds a new chip under an overlay.
  void addChip(String chipKey, KeyPaintChip? chip) {
    if (chip != null) {
      final overlay = getChip(ChipKey.overlay.toString());

      removeChip(ChipKey.overlay.toString());
      _chips.putIfAbsent(chipKey, () => chip);

      // add existing overlay on top of the chips.
      if (overlay != null) {
        _chips.putIfAbsent(ChipKey.overlay.toString(), () => overlay);
      }
    }
  }

  /// [getChip] returns a chip with matching [chipKey].
  KeyPaintChip? getChip(String chipKey) {
    return _chips[chipKey];
  }

  /// [updateChip] updates the state of a chip in [chips].
  ///
  /// Adds a new chip layer if the chip with [chipKey] does not exist.
  void updateChip(String chipKey, {double? opacity, bool showOutline = false}) {
    KeyPaintChip? chip = getChip(chipKey);

    if (chip == null) {
      // add a new chip.
      chip = KeyPaintRect();
      addChip(chipKey, chip);
    }

    if (chip.runtimeType == KeyPaintRect) {
      (chip as KeyPaintRect)
        ..opacity = opacity!
        ..showOutline = showOutline;
    }

    chip.color = _highlightColor;
  }

  /// [removeChip] deletes chip layer whose key matches [chipKey].
  void removeChip(String chipKey) {
    _chips.removeWhere((key, value) => key == chipKey);
  }

  /// [selectKey] highlights [KeyModel] under a selected zone.
  ///
  /// [animValue] is an animation value which determines behaviour of the key.
  void selectKey(
    bool? isWidgetInZone,
    int id,
    bool isVisible, {
    required double animValue,
  }) {
    // highlight the chip with keys matching id
    if (isWidgetInZone == true) {
      _isSelected = true;
      final opacity = isVisible ? animValue : 0.0;
      updateChip(id.toString(), opacity: opacity, showOutline: true);
    }
    // remove chip with specific id
    else if (isWidgetInZone == false) {
      _isSelected = false;
      removeChip(id.toString());
    }
    // update selected chip opacity
    else if (isSelected) {
      updateChip(id.toString(),
          opacity: isVisible ? animValue : 0.0, showOutline: false);
    }
  }

  // /// [clearKeys] restore [KeyModel] previous settings.
  // void clearKeys() {
  //   // restore base key settings i.e. remove chip.id if exists.
  //   _isSelected = false;
  //   getBase().color = Colors.black;
  // }
}

enum ChipKey {
  /// [base] is intended to be the first layer in the chips collection.
  base,

  /// [overlay] is the topmost layer in the chips collection.
  overlay,
}

mixin KeyPaintChip {
  late Color color;
  late bool isOverlay;
}

class KeyIconCubic {
  const KeyIconCubic(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);
  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;
}

class KeyIconLine {
  const KeyIconLine(this.x1, this.y1);
  final double x1;
  final double y1;
}

class KeyIconPath {
  late double x;
  late double y;
  late List<KeyIconLine> keyIconLines;
}

class KeyPaintIcon with KeyPaintChip {
  /// [KeyPaintIcon] intended to draw icon on a canvas.
  KeyPaintIcon({
    Color pathColor = Colors.white,
    List<KeyIconPath>? pathsValue,
  }) {
    color = pathColor;
    paths = pathsValue;
    isOverlay = true;
  }

  List<KeyIconPath>? paths;
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
    showOutline = false;
    color = rectColor;
    opacity = rectOpacity;
    paintingStyle = rectPaintingStyle;
    strokeCap = rectStrokeCap;
    strokeJoin = rectStrokeJoin;
    strokeWidthFactor = rectStrokeWidthFactor;
  }

  late bool showOutline;
  late double opacity;
  late PaintingStyle paintingStyle;
  late StrokeCap strokeCap;
  late StrokeJoin strokeJoin;
  late double strokeWidthFactor;
}

Color get colorRandom => Color(0xffffffff & Random().nextInt(0xffffffff));
