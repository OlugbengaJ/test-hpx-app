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

  double top = 0.0;
  double bottom = 0.0;
  double left = 0.0;
  double right = 0.0;
}
