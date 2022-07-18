import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.icon,
    required this.layers,
    required this.associatedApps,
    this.createdDate,
  });

  final int id;
  final String name;
  final String icon;
  List<LayerItemModel> layers = [];
  List<Application> associatedApps = [];
  final DateTime? createdDate;

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
      createdDate: createdDate,
    );
  }

  Profile.fromMap(Map<String, dynamic> item)
      : id = item['id'],
        name = item['name'],
        icon = item['icon'],
        createdDate = item['createdDate'],
        layers = getLayersFromMap(item['layers']),
        associatedApps = getAssociatedAppsFromMap(
          item['associatedApps'],
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'layers': getLayersAsMap(),
      'associatedApps': getAssociatedAppsAsMap(),
      'createdDate': createdDate,
    };
  }

  static getLayersFromMap(List<Map<String, dynamic>>? layersJson) {
    var result = layersJson?.map((e) => LayerItemModel.fromJson(e)).toList();
    if (result != null) return result;
    return <LayerItemModel>[];
  }

  static getAssociatedAppsFromMap(
      List<Map<String, dynamic>>? associatedAppsJson) {
    var apps = associatedAppsJson?.map((e) => Application.fromJson(e)).toList();
    if (apps != null) return apps;
    return <Application>[];
  }

  List<Map<String, dynamic>> getLayersAsMap() {
    List<Map<String, dynamic>> layerMaps = [];
    layers.forEach((element) {
      layerMaps.add(element.toMap());
    });
    return layerMaps;
  }

  List<Map<String, dynamic>> getAssociatedAppsAsMap() {
    List<Map<String, dynamic>> appMaps = [];
    associatedApps.forEach((element) {
      appMaps.add(element.toMap());
    });
    return appMaps;
  }
}

class Application {
  Application({
    required this.name,
    required this.icon,
    required this.file,
    this.createdDate,
  });

  final String name;
  final String icon;
  final String file;
  final DateTime? createdDate;

  /// [copyWith] returns a new instance of [Application].
  Application copyWith({
    String? name,
    String? icon,
    String? file,
  }) {
    return Application(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      file: file ?? this.file,
      createdDate: createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon,
      'file': file,
      'createdDate': createdDate,
    };
  }

  Application.fromJson(Map<String, dynamic> item)
      : name = item['name'],
        icon = item['icon'],
        file = item['file'],
        createdDate = item['createdDate'];
}
