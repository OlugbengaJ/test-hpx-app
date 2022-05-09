import '../../apps/z_light/layers/widgets/resizable_widget_controller.dart';
import 'package:flutter/material.dart';

const Color defaultColor = Colors.white;
const Color defaultPaintColor = Colors.white;

class LayerItemModel {
  LayerItemModel({required this.id, required this.layerText, this.visible = true, this.visibleOnStack = true, required this.controller, this.listDisplayColor = defaultColor, this.paintColor = defaultPaintColor});
  final int id;
  final String layerText;
  final bool visible;
  bool visibleOnStack;
  ResizableWidgetController controller;
  Color listDisplayColor;
  Color paintColor;
}
