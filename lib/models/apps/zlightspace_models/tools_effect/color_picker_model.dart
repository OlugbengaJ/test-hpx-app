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

  /// name variable with type string
  String name;

  /// action variable with type string
  final String? action;

  /// label variable with type string
  final String? label;

  /// width variable with type double
  final double? width;

  /// height variable with type double
  final double? height;

  /// canEdit variable determines whether the color can be change using the color picker pop up
  final bool? canEdit;

  /// hasBorder variable deterrmine whether the widget has a border or not
  final bool? hasBorder;

  /// setRandom variable determine whether the widget should use a random color or not
  final bool? setRandom;

  /// colorCode variable holds a list of colors or color code been used by the colorpicker widget
  late final List<Color> colorCode;

  /// pickertype determine whether the color pickerwidget is of a solid or gradient design
  final String? pickerType;

  /// the gradient variable get input of the type of gradient been used (linear or circular)
  String? gradient;
}
