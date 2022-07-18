// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectsModel _$EffectsModelFromJson(Map<String, dynamic> json) => EffectsModel(
      degree: (json['degree'] as num?)?.toDouble() ?? 0.0,
      size: (json['size'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0,
      updatePerSecond: (json['updatePerSecond'] as num?)?.toDouble() ?? 0.0,
      imageQuality: (json['imageQuality'] as num?)?.toDouble() ?? 0.0,
      effectType: json['effectType'] as String?,
      extractedColors: (json['extractedColors'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) =>
                  const ColorConverter().fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      imageBytes: _$JsonConverterFromJson<Map<String, dynamic>, Uint8List>(
          json['imageBytes'], const ImageConverter().fromJson),
      effectName: json['effectName'] ?? "mood",
    )..modeId = json['modeId'] as int?;

Map<String, dynamic> _$EffectsModelToJson(EffectsModel instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'speed': instance.speed,
      'size': instance.size,
      'updatePerSecond': instance.updatePerSecond,
      'imageQuality': instance.imageQuality,
      'effectType': instance.effectType,
      'effectName': instance.effectName,
      'extractedColors': instance.extractedColors
          ?.map((e) => e.map(const ColorConverter().toJson).toList())
          .toList(),
      'imageBytes': _$JsonConverterToJson<Map<String, dynamic>, Uint8List>(
          instance.imageBytes, const ImageConverter().toJson),
      'modeId': instance.modeId,
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
