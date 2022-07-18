// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayerItemModel _$LayerItemModelFromJson(Map<String, dynamic> json) =>
    LayerItemModel(
      id: json['id'] as int,
      parentID: json['parentID'] as int? ?? 0,
      layerText: json['layerText'] as String,
      visible: json['visible'] as bool? ?? true,
      visibleOnStack: json['visibleOnStack'] as bool? ?? true,
      isSublayer: json['isSublayer'] as bool? ?? false,
      hasSublayer: json['hasSublayer'] as bool? ?? false,
      listDisplayColor: json['listDisplayColor'] == null
          ? defaultColor
          : const ColorConverter()
              .fromJson(json['listDisplayColor'] as Map<String, dynamic>),
      paintColor: json['paintColor'] == null
          ? defaultPaintColor
          : const ColorConverter()
              .fromJson(json['paintColor'] as Map<String, dynamic>),
      shortcutColor: json['shortcutColor'] == null
          ? defaultPaintColor
          : const ColorConverter()
              .fromJson(json['shortcutColor'] as Map<String, dynamic>),
      top: (json['top'] as num?)?.toDouble() ?? 0,
      bottom: (json['bottom'] as num?)?.toDouble() ?? 0,
      left: (json['left'] as num?)?.toDouble() ?? 0,
      right: (json['right'] as num?)?.toDouble() ?? 0,
      icon: json['icon'] == null
          ? Icons.mood
          : const IconDataConverter()
              .fromJson(json['icon'] as Map<String, dynamic>),
    )..mode = _$JsonConverterFromJson<Map<String, dynamic>, ToolsModeModel>(
        json['mode'], const ToolsModeConverter().fromJson);

Map<String, dynamic> _$LayerItemModelToJson(LayerItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentID': instance.parentID,
      'layerText': instance.layerText,
      'visible': instance.visible,
      'isSublayer': instance.isSublayer,
      'icon': const IconDataConverter().toJson(instance.icon),
      'hasSublayer': instance.hasSublayer,
      'visibleOnStack': instance.visibleOnStack,
      'listDisplayColor':
          const ColorConverter().toJson(instance.listDisplayColor),
      'paintColor': const ColorConverter().toJson(instance.paintColor),
      'shortcutColor': const ColorConverter().toJson(instance.shortcutColor),
      'mode': _$JsonConverterToJson<Map<String, dynamic>, ToolsModeModel>(
          instance.mode, const ToolsModeConverter().toJson),
      'top': instance.top,
      'bottom': instance.bottom,
      'left': instance.left,
      'right': instance.right,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
