import 'dart:core';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:hpx/utils/custom_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'effects_model.g.dart';

//// class interface model for Effects
@JsonSerializable()
class EffectsModel {
  //// Effects model initialization model and value default set
  /// default degree value = 0.0
  /// default size value = 0.0
  /// default speed value = 0
  /// default updatePerSecond value = 0.0
  /// default image quality percentage value = 0.0
  /// default effectName value = "mood"
  EffectsModel(
      {this.degree = 0.0,
      this.size = 0.0,
      this.speed = 0,
      this.updatePerSecond = 0.0,
      this.imageQuality = 0.0,
      this.effectType,
      this.extractedColors,
      this.imageBytes,
      this.effectName = "mood"});

  /// degree variable with type double
  double? degree;

  /// speed variable with type double
  double? speed;

  /// size variable with type double
  double? size;

  /// updatePerSecond variable with type double
  double? updatePerSecond;

  /// image quality variable with type double
  double? imageQuality;

  /// effect type variable with type double
  String? effectType;

  /// effect name variable with type double
  dynamic? effectName;

  /// effect extractColors for the extract colors matrix from image
  @ColorConverter()
  List<List<Color>>? extractedColors;

  /// effect image for the extract colors matrix
  @ImageConverter()
  Uint8List? imageBytes;

  /// mode id for relation in database
  int? modeId;

  Map<String, dynamic> toJson() => _$EffectsModelToJson(this);

  factory EffectsModel.fromJson(Map<String, dynamic> json) =>
      _$EffectsModelFromJson(json);
}
