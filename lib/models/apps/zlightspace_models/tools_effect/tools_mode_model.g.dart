// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools_mode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolsModeModel _$ToolsModeModelFromJson(Map<String, dynamic> json) =>
    ToolsModeModel(
      currentColor: json['currentColor'] as List<dynamic>,
      effects: const EffectsModelConverter()
          .fromJson(json['effects'] as Map<String, dynamic>),
      name: json['name'] as String,
      modeType: $enumDecodeNullable(_$EnumModeTypeEnumMap, json['modeType']) ??
          EnumModeType.layers,
      icon: _$JsonConverterFromJson<Map<String, dynamic>, IconData>(
          json['icon'], const IconDataConverter().fromJson),
      subMode: json['subMode'],
      shortcutKeys: (json['shortcutKeys'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      display: json['display'],
      value: json['value'],
    )..id = json['id'] as int?;

Map<String, dynamic> _$ToolsModeModelToJson(ToolsModeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'modeType': _$EnumModeTypeEnumMap[instance.modeType],
      'subMode': instance.subMode,
      'display': instance.display,
      'icon': _$JsonConverterToJson<Map<String, dynamic>, IconData>(
          instance.icon, const IconDataConverter().toJson),
      'value': instance.value,
      'currentColor': instance.currentColor,
      'shortcutKeys': instance.shortcutKeys,
      'effects': const EffectsModelConverter().toJson(instance.effects),
      'id': instance.id,
    };

const _$EnumModeTypeEnumMap = {
  EnumModeType.layers: 'layers',
  EnumModeType.sublayer: 'sublayer',
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
