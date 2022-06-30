import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/workspace_models/key_code.dart';

class KeyModel with ChangeNotifier {
  KeyModel({
    required this.keyRow,
    required this.keyColumn,
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

  /// [keyColumn] is used to divide the keys into columns so that
  /// different colors can be applied to each column while using wave effect.
  final int keyColumn;

  /// [keyCode] uniquely identifies a key and is fixed regarless of language.
  final KeyCode keyCode;

  final double keyLeft;
  final double keyTop;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;

  /// [copyWith] returns a new instance of [KeyModel].
  KeyModel copyWith({
    Map<String, KeyPaintChip>? chips,
    int? keyRow,
    KeyCode? keyCode,
    double? keyWidth,
    double? keyHeight,
    double? keyRadius,
    double? keyLeft,
    double? keyTop,
  }) {
    return KeyModel(
      keyRow: keyRow ?? this.keyRow,
      keyColumn: keyColumn,
      keyCode: keyCode ?? this.keyCode,
      keyWidth: keyWidth ?? this.keyWidth,
      keyHeight: keyHeight ?? this.keyHeight,
      keyRadius: keyRadius ?? this.keyRadius,
      keyLeft: keyLeft ?? this.keyLeft,
      keyTop: keyTop ?? this.keyTop,
    ).._chips = chips ?? this.chips;
  }

  /// [_chips] holds multiple layers of a key
  /// e.g. a key could have only 1 base color, multiple layers with unique keys,
  /// and only 1 overlay (text or icon layer).
  ///
  /// Each layer of the chip will be rendered from first to last and by default,
  /// a chip is initialized with a [KeyPaintRect] base.
  Map<String, KeyPaintChip> _chips = {
    ChipKey.base.toString(): KeyPaintRect(ChipKey.base.toString()),
  };

  /// [chips] returns the values of [_chips] as a new list.
  Map<String, KeyPaintChip> get chips =>
      _chips.map((key, value) => MapEntry(key, value));

  /// [chipsValues] returns the values of [_chips] as a new list.
  List<KeyPaintChip> get chipsValues => [..._chips.values];

  /// [topChip] returns the topmost layered paint of this key.
  KeyPaintRect? get topChip => getLayeredChips().last;

  /// [addChipIcon] adds an icon layer to chips.
  void addChipIcon(
    List<KeyIconPath>? iconPath, {
    Color? color,
  }) {
    final icon = KeyPaintIcon(pathsValue: iconPath)
      ..chipKey = '${ChipKey.overlay}';

    if (color != null) icon.color = color;

    addChip(icon);
  }

  /// [addChipText] adds a text layer to chips.
  void addChipText(
    String keyText, {
    Color? color,
    TextDirection? textDirection,
  }) {
    final text = KeyPaintText(textValue: keyText)
      ..chipKey = '${ChipKey.overlay}';

    if (color != null) text.color = color;
    if (textDirection != null) text.direction = textDirection;

    addChip(text);
  }

  /// [addChip] adds a new chip under an overlay.
  void addChip(KeyPaintChip? chip) {
    if (chip != null) {
      final overlay = getChip(ChipKey.overlay.toString());

      removeChip(ChipKey.overlay.toString());
      _chips.putIfAbsent(chip.chipKey, () => chip);

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

  bool _isLayerChip(String k) {
    return k != ChipKey.base.toString() && k != ChipKey.overlay.toString();
  }

  /// [getLayeredChipsKeys] returns chips keys other than base, overlay, and icon
  List<String> getLayeredChipsKeys() {
    return _chips.keys.where((k) => _isLayerChip(k)).toList();
  }

  /// [getLayeredChips] returns chips other than base, overlay, and icon
  List<KeyPaintRect?> getLayeredChips() {
    return [
      ...chips.entries.map((e) {
        if (_isLayerChip(e.key)) {
          return e.value as KeyPaintRect;
        } else {
          return null;
        }
      })
    ].where((element) => element != null).toList();
  }

  /// [removeChip] deletes chip layer whose key matches [chipKey].
  void removeChip(String chipKey) {
    _chips.removeWhere((key, value) => key == chipKey);
  }
}

enum ChipKey {
  /// [base] is intended to be the first layer in the chips collection.
  base,

  /// [overlay] is the topmost layer in the chips collection.
  overlay,
}

mixin KeyPaintChip {
  late String chipKey;
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
    chipKey = ChipKey.overlay.toString();
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
    chipKey = ChipKey.overlay.toString();
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
  KeyPaintRect(
    String key, {
    Color rectColor = Colors.black,
    double rectOpacity = 1.0,
    PaintingStyle rectPaintingStyle = PaintingStyle.fill,
    StrokeCap rectStrokeCap = StrokeCap.round,
    StrokeJoin rectStrokeJoin = StrokeJoin.round,
    double rectStrokeWidthFactor = 50,
  }) {
    chipKey = key;
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
