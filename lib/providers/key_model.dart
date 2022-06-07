import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
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

  late List<LayerItemModel> layers = [];

  // /// [_isSelected] indicates key is selected.
  // bool _isSelected = false;
  // bool get isSelected => _isSelected;

  /// [_chips] holds multiple layers of a key
  /// e.g. a key could have only 1 base color, multiple layers with unique keys,
  /// and only 1 overlay (text or icon layer).
  ///
  /// Each layer of the chip will be rendered from first to last and by default,
  /// a chip is initialized with a [KeyPaintRect] base.
  final Map<String, KeyPaintChip> _chips = {
    ChipKey.base.toString(): KeyPaintRect(ChipKey.base.toString()),
  };

  /// [chips] returns the values of [_chips] as a new list.
  Map<String, KeyPaintChip> get chips => _chips;

  /// [chipsValues] returns the values of [_chips] as a new list.
  List<KeyPaintChip> get chipsValues => [..._chips.values];

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

  /// [getLayeredChips] returns chips other than base, overlay, and icon
  List<String> getLayeredChips() {
    return _chips.keys
        .where((k) =>
            k != ChipKey.base.toString() && k != ChipKey.overlay.toString())
        .toList();
  }

  /// [removeChip] deletes chip layer whose key matches [chipKey].
  void removeChip(String chipKey) {
    _chips.removeWhere((key, value) => key == chipKey);
  }

  // /// [updateChip] updates the state of a chip in [chips].
  // ///
  // /// Adds a new chip layer if the chip with [chipKey] does not exist.
  // void updateChip(String chipKey,
  //     {Color? color, double? opacity, bool showOutline = false}) {
  //   // for (var i = layers.length - 1; i >= 0; i--) {
  //   // debugPrint('${layers[i].mode?.currentColor.first}');
  //   // layers[i].mode?.currentColor.forEach(print);

  //   // String chipKey = layers[layerIndex].id.toString();
  //   // remove layer chip at index
  //   KeyPaintChip? chip = getChip(chipKey);
  //   if (chip == null) {
  //     // add a new chip.
  //     chip = KeyPaintRect(chipKey);
  //     addChip(chip);
  //     // chip exists and needs to be recreated
  //     // final oldChipColor = chip.color;
  //     // _removeChip(chipKey);
  //   }
  //   // add a new chip
  //   // chip.color = layers[layerIndex].mode?.currentColor.first;
  //   chip.color = color ?? Colors.grey;
  //   // addChip(chipKey, chip);
  //   // _updateChipsExclude('$i', chips.indexOf(chip));
  //   // }

  //   // if (chip == null) {
  //   //   // add a new chip.
  //   //   chip = KeyPaintRect();
  //   //   addChip(chipKey, chip);
  //   // }

  //   // if (chip.runtimeType == KeyPaintRect) {
  //   //   (chip as KeyPaintRect)
  //   //     ..opacity = opacity!
  //   //     ..showOutline = showOutline;

  //   //   _updateChipsExclude(chipKey, chips.indexOf(chip));
  //   // }

  //   // chip!.color = highlightColor;
  // }

  // /// [selectKey] highlights [KeyModel] under a selected zone.
  // ///
  // /// [opacity] is an animation value which determines behaviour of the key.
  // void selectKey(
  //   bool? isWidgetInZone,
  //   int layerIndex,
  //   bool isVisible, {
  //   required double opacity,
  //   // chip has animation
  //   bool isAnimated = false,
  //   required List<LayerItemModel> currentLayers,
  // }) {
  //   opacity = isVisible ? opacity : 0.0;
  //   // debugPrint(
  //   //     '$id layers = ${layers.length} newLayers = ${currentLayers.length}');
  //   layers = currentLayers;

  //   if (isWidgetInZone == true) {
  //     // TODO: note this is an experimental feature and may not behave as expected.
  //     // uncomment the line below to test a default blinking effect on a Zbook;
  //     // KeyboardController.blinkingEffect();

  //     // key selected, highlight the chip with keys matching id
  //     // debugPrint('sel $keyCode $id ${layers[id].id}');

  //     // _isSelected = true;
  //     // _updateChip(layerIndex, opacity: opacity, showOutline: true);
  //   } else if (isWidgetInZone == false) {
  //     // key unselected, remove chip with specific id
  //     // debugPrint('\t not sel $keyCode $layerIndex ${layers[layerIndex].id}');

  //     // _isSelected = false;
  //     removeChip(layers[layerIndex].id.toString());
  //   } else if (isSelected) {
  //     // update selected chip opacity when visibility is disabled.

  //     // _updateChip(id.toString(), opacity: opacity, showOutline: false);
  //   }
  // }
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
