import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/key_model.dart';

const Color defaultColor = Colors.white;
const Color defaultPaintColor = Colors.white;

class LayerItemModel {
  LayerItemModel({
    required this.id,
    this.parentID = 0,
    required this.layerText,
    this.visible = true,
    this.visibleOnStack = true,
    this.isSublayer = false,
    this.hasSublayer = false,
    this.listDisplayColor = defaultColor,
    this.paintColor = defaultPaintColor,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.icon = Icons.mood,
  });
  final int id;
  int parentID;
  String layerText;
  bool visible = true;
  bool isSublayer = false;
  IconData icon = Icons.mood;
  bool hasSublayer;
  bool visibleOnStack;
  Color listDisplayColor;
  Color paintColor;
  ToolsModeModel? mode;
  List<KeyModel> _keys = [];

  List<KeyModel> get keys => _keys;
  void setKeys(List<KeyModel> keys) {
    _keys = [...keys];
  }

  /// [_getKeyIndex] returns the index of the key in [_keys]
  int _getKeyIndex(KeyModel key) {
    return _keys.indexWhere((k) => k.keyCode == key.keyCode);
  }

  /// [addKey] check if key exists, then replaces the existing key
  /// otherwise adds a new key.
  void addKey(KeyModel key) {
    // removes key if it exists
    removeKey(key);

    // add new key
    _keys.add(key);
  }

  /// [removeKey] removes an existing key
  void removeKey(KeyModel key) {
    // check if key exists, then remove existing key
    final index = _getKeyIndex(key);

    if (index != -1) {
      // remove existing key
      _keys.removeAt(index);
    }
  }

  double top = 0.0;
  double bottom = 0.0;
  double left = 0.0;
  double right = 0.0;
}
