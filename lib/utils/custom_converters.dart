import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/effects_model.dart';

import '../providers/key_model.dart';

class IconDataConverter extends JsonConverter<IconData, Map<String, dynamic>> {

  @override
  IconData fromJson(json) {
    return IconData(
        json['codePoint'],
        fontFamily: json['fontFamily'],
        fontPackage: json['fontPackage']
    );
  }

  @override
  toJson(IconData object) {
    return {
      'codePoint' : object.codePoint,
      'fontFamily' : object.fontFamily,
      'fontPackage' : object.fontPackage
    };
  }

  const IconDataConverter();
}


class ImageConverter extends JsonConverter<Uint8List, Map<String, dynamic>> {

  @override
  Uint8List fromJson(json) {
    return Uint8List(100);
  }

  @override
  toJson(Uint8List object) {
    return {
      'value': 100
    };
  }

  const ImageConverter();
}


class ColorConverter extends JsonConverter<Color, Map<String, dynamic>> {

  @override
  Color fromJson(json) {
    return Color(json['value']);
  }

  @override
  toJson(Color object) {
    return {
      'value': object.value
    };
  }

  const ColorConverter();
}


class LayerItemConverter extends JsonConverter<LayerItemModel, Map<String, dynamic>> {

  @override
  LayerItemModel fromJson(json) {
    return LayerItemModel.fromJson(json);
  }

  @override
  toJson(LayerItemModel object) {
    return object.toJson();
  }

  const LayerItemConverter();
}


class ApplicationConverter extends JsonConverter<Application, Map<String, dynamic>> {

  @override
  Application fromJson(json) {
    return Application.fromJson(json);
  }

  @override
  toJson(Application object) {
    return object.toJson();
  }

  const ApplicationConverter();
}


class ToolsModeConverter extends JsonConverter<ToolsModeModel, Map<String, dynamic>> {

  @override
  ToolsModeModel fromJson(json) {
    return ToolsModeModel.fromJson(json);
  }

  @override
  toJson(ToolsModeModel object) {
    return object.toJson();
  }

  const ToolsModeConverter();
}


class EffectsModelConverter extends JsonConverter<EffectsModel, Map<String, dynamic>> {

  @override
  EffectsModel fromJson(json) {
    return EffectsModel.fromJson(json);
  }

  @override
  toJson(EffectsModel object) {
    return object.toJson();
  }

  const EffectsModelConverter();
}


class KeyModelConverter extends JsonConverter<KeyModel, Map<String, dynamic>> {

  @override
  KeyModel fromJson(json) {
    return KeyModel.fromJson(json);
  }

  @override
  toJson(KeyModel object) {
    return object.toJson();
  }

  const KeyModelConverter();
}