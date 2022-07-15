import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/utils/custom_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profiles_model.g.dart';

@JsonSerializable()
class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.icon,
    required this.layers,
    required this.associatedApps,
  });

  final int id;
  final String name;
  final String icon;

  @LayerItemConverter()
  List<LayerItemModel> layers = [];

  @ApplicationConverter()
  List<Application> associatedApps = [];

  /// [copyWith] returns a new instance of [Profile].
  Profile copyWith({
    int? id,
    String? name,
    String? icon,
    List<LayerItemModel>? layers,
    List<Application>? associatedApps,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      layers: layers ?? [...this.layers],
      associatedApps:
          associatedApps ?? [...this.associatedApps.map((e) => e.copyWith())],
    );
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

}

@JsonSerializable()
class Application {
  Application({
    this.id,
    required this.name,
    required this.icon,
    required this.file,
  });

  int? id;
  final String name;
  final String icon;
  final String file;

  /// [copyWith] returns a new instance of [Application].
  Application copyWith({
    int? id,
    String? name,
    String? icon,
    String? file,
  }) {
    return Application(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}
