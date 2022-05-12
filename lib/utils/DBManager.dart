import 'dart:io';
import 'package:hpx/models/apps/zlightspace_models/tools_effect/color_picker_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DBManager {
  static const _dbUserName = "hpxapp";
  static const _dbPassword = "iSrvhODjU9bBKMn8";
  static const _connectionURL =
      "mongodb+srv://$_dbUserName:$_dbPassword@cluster0.oqikl.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

  DBManager._();
  static final DBManager instance = DBManager._();
  static late Db _database;

  static Db get database {
    if (_database != null) return _database;
    _initDatabase();
    return _database;
  }

  static _initDatabase() async {
    _database = await Db.create(_connectionURL);
    await _database.open();
  }

  static Future<List<Map<String, dynamic>>> _getAllProfiles() async {
    DbCollection collection = database.collection("profiles");
    return await collection.find().toList();
  }

  static Future<Map<String, dynamic>?> _getOneProfile(String profileId) async {
    DbCollection collection = database.collection("profiles");
    return await collection.findOne(where.eq("id", profileId));
  }

  static Future<void> saveProfile(Map<String, dynamic> profileData) async {
    DbCollection collection = database.collection("profiles");
    collection.insert(profileData);
  }

  static Future<void> updateProfile(Map<String, dynamic> profileData) async {
    DbCollection collection = database.collection("profiles");
    var profileId = profileData['id'];
    collection.update(
        collection.findOne(where.eq("id", profileId)), profileData);
  }

  static Future<void> deleteProfile(Map<String, dynamic> profileData) async {
    DbCollection collection = database.collection("profiles");
    var profileId = profileData['id'];
    collection.remove(collection.findOne(where.eq("id", profileId)));
  }

  static List<ColorPickerWidgetModel> getAllToolsEffects() {
    List<ColorPickerWidgetModel> _listOfItems = [];
    var listOfFutureItems = _getAllToolsEffects();
    listOfFutureItems.then((value) => {
          if (value != null)
            value.forEach((item) => _listOfItems.add(ColorPickerWidgetModel(
                //toolId: item['toolId'],
                name: item['name'],
                colorCode: item['colorCode'],
                colorDirection: item['colorDirection'],
                hasBorder: item['hasBorder'])))
        });
    return _listOfItems;
  }

  static Future<List<Map<String, dynamic>>> _getAllToolsEffects() async {
    DbCollection collection = database.collection("tools_effects");
    return await collection.find().toList();
  }

  static Future<Map<String, dynamic>?> _getOneToolEffect(
      String toolEffectId) async {
    DbCollection collection = database.collection("tools_effects");
    return await collection.findOne(where.eq("id", toolEffectId));
  }

  static ColorPickerWidgetModel? getOneToolEffect(String toolEffectId) {
    ColorPickerWidgetModel? item;
    _getOneToolEffect(toolEffectId).then((value) => item =
        ColorPickerWidgetModel(
            name: value!["name"], colorCode: value["colorCode"]));
    return item;
  }

  static Future<void> updateToolEffect(
      Map<String, dynamic> toolEffectData) async {
    DbCollection collection = database.collection("tools_effects");
    var tootEffectId = toolEffectData['id'];
    collection.update(
        collection.findOne(where.eq("id", tootEffectId)), toolEffectData);
  }

  static Future<void> syncKeyboardColor(Map<String, dynamic> color) async {
    DbCollection collection = database.collection("test2");
    collection.insert(color);
  }
}
