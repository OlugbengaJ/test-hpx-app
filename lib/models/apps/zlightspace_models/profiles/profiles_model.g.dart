// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      layers: (json['layers'] as List<dynamic>)
          .map((e) =>
              const LayerItemConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      associatedApps: (json['associatedApps'] as List<dynamic>)
          .map((e) =>
              const ApplicationConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'layers': instance.layers.map(const LayerItemConverter().toJson).toList(),
      'associatedApps': instance.associatedApps
          .map(const ApplicationConverter().toJson)
          .toList(),
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      id: json['id'] as int?,
      name: json['name'] as String,
      icon: json['icon'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'file': instance.file,
    };
