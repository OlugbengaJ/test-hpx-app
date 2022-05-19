import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
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
    required this.mode
  });
  final int id;
  int parentID;
  String layerText;
  final bool visible;
  final bool isSublayer;
  bool hasSublayer;
  bool visibleOnStack;
  Color listDisplayColor;
  Color paintColor;
  ToolsModeModel mode;
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
