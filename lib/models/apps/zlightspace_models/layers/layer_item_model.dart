import 'package:hpx/apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';

const Color defaultColor = Colors.white;
const Color defaultPaintColor = Colors.white;

class LayerItemModel {
  LayerItemModel(
      {required this.id,
      required this.layerText,
      this.visible = true,
      this.visibleOnStack = true,
      required this.controller,
      this.listDisplayColor = defaultColor,
      this.paintColor = defaultPaintColor,
      required this.mode
      });
  final int id;
  final String layerText;
  final bool visible;
  bool visibleOnStack;
  ResizableWidgetController controller;
  Color listDisplayColor;
  Color paintColor;
  ToolsModeModel mode;
}
