import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:hpx/providers/key_model.dart';

const Color defaultColor = Colors.white;
const Color defaultPaintColor = Colors.white;

class LayerItemModel {
  LayerItemModel({
    required this.id,
    this.parentID = 0,
    required this.profileID,
    required this.layerText,
    this.visible = true,
    this.visibleOnStack = true,
    this.isSublayer = false,
    this.hasSublayer = false,
    this.listDisplayColor = defaultColor,
    this.paintColor = defaultPaintColor,
    this.shortcutColor = defaultPaintColor,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.icon = Icons.mood,
  });

  final int id;
  int parentID;
  int profileID;
  String layerText;
  bool visible = true;
  bool isSublayer = false;
  IconData icon = Icons.mood;
  bool hasSublayer;
  bool visibleOnStack;
  Color listDisplayColor;
  Color paintColor;
  Color shortcutColor;
  ToolsModeModel? mode;
  List<KeyModel> _keys = [];

  List<KeyModel> get keys => _keys;

  void setKeys(List<KeyModel> keys) {
    _keys = [...keys];
  }

  /// [getKeyIndex] returns the index of the key in [_keys]
  int getKeyIndex(KeyModel key) {
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
    final index = getKeyIndex(key);

    if (index != -1) {
      // remove existing key
      _keys.removeAt(index);
    }
  }

  double top = 0.0;
  double bottom = 0.0;
  double left = 0.0;
  double right = 0.0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentID,
      'profileID': profileID,
      'layerText': layerText,
      'visible': visible.toString(),
      'visibleOnStack': visibleOnStack.toString(),
      'isSublayer': isSublayer.toString(),
      'hasSublayer': hasSublayer.toString(),
      'listDisplayColor': listDisplayColor.value,
      'paintColor': paintColor.value,
      'shortcutColor': shortcutColor.value,
      'top': top,
      'bottom': bottom,
      'left': left,
      'right': right,
      'mode': mode?.toMap(),
      'icon': {'codePoint': icon.codePoint, 'fontFamily': icon.fontFamily}
    };
  }

  LayerItemModel.fromJson(Map<String, dynamic> item)
      : id = item['id'],
        parentID = item['parentId'],
        profileID = item['profileID'],
        layerText = item['layerText'],
        visible = item['visible'] == 'true',
        visibleOnStack = item['visibleOnStack'] == 'true',
        isSublayer = item['isSublayer'] == 'true',
        hasSublayer = item['hasSublayer'] == 'true',
        listDisplayColor = Color(item['listDisplayColor']),
        paintColor = Color(item['paintColor']),
        shortcutColor = Color(item['shortcutColor']),
        //mode = ToolsModeModel.fromJson(item['mode']),
        top = item['top'],
        bottom = item['bottom'],
        left = item['left'],
        right = item['right'],
        icon = IconData(item['codePoint'], fontFamily: item['fontFamily']);
}
