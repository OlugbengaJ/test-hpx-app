import 'package:flutter/material.dart';

class ColorPickerWidgetModel {
  ColorPickerWidgetModel(
      {required this.name,
      this.canEdit = false,
      this.action = "",
      this.label = "",
      this.hasBorder = true,
      this.setRandom = false,
      this.width,
      this.height = 20.0,
      required this.colorCode,
      this.pickerType = "solid",
      this.gradient = "linear"});

  String name;
  final String? action;
  final String? label;
  final double? width;
  final double? height;
  final bool? canEdit;
  final bool? hasBorder;
  final bool? setRandom;
  late final List<Color> colorCode;
  // picker = 'solid' || 'gradient'
  final String? pickerType;
  String? gradient;
}
