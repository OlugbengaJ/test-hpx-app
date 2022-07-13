import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';

class Profile {
  Profile(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.layers,
      required this.associatedApps});

  final int id;
  final String name;
  final String imageUrl;
  List<LayerItemModel> layers = [];
  List<Application> associatedApps = [];

  Profile.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        name = item["name"],
        imageUrl = item["imageUrl"],
        layers = getLayersFromMap(item["layers"]),
        associatedApps = getAssociatedAppsFromMap(item["associatedApps"]);

  Map<String, Object> toMap() {
    return {
      "id": id,
      "name": name,
      "imageUrl": imageUrl,
      "layers": getLayersAsMap(),
      "associatedApps": getAssociatedAppsAsMap()
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
  Map<String, dynamic> toMap() {
    throw UnimplementedError("error");
  }

  Application.fromJson(e) {
    throw UnimplementedError("error");
  }
}
