import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hpx/models/apps/zlightspace_models/layers/layer_item_model.dart';
import 'package:hpx/providers/tools_effect_provider/mode_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/apps/zlightspace_models/profiles/profiles_model.dart';
import '../models/apps/zlightspace_models/tools_effect/tools_mode_model.dart';

class DatabaseManager {
  DatabaseManager._();

  static final DatabaseManager instance = DatabaseManager._();

  static Future<Database> _initDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'database.db'),
      onCreate: onCreateDatabase,
      version: 1,
    );
  }

  static Future<List<Profile>> getAllProfiles() async {
    final Database database = await _initDatabase();
    final List<Map<String, Object?>> profilesQueryResult =
        await database.query('profiles');
    List<Profile> loadedProfiles = profilesQueryResult.map((e) =>
        Profile.fromMap(e)).toList();

    for (var profile in loadedProfiles) {
      final List<Map<String, Object?>> layersQueryResult =
          await database.rawQuery("SELECT * FROM layers "
              " INNER JOIN icons ON icons.layerId = layers.id "
              " WHERE profileId = ${profile.id}");
      List<LayerItemModel> loadedLayers = layersQueryResult.map((e) =>
          LayerItemModel.fromJson(e)).toList();

      for (var layer in loadedLayers) {
        final List<Map<String, Object?>> modeQueryResult =
        await database.rawQuery("SELECT * FROM tools_mode "
            " INNER JOIN icons ON icons.modeId = tools_mode.id "
            " INNER JOIN effects ON effects.modeId = tools_mode.id "
            " WHERE tools_mode.layerId = ${layer.id}");
        final modesList = modeQueryResult.map((e) => ToolsModeModel.fromJson(e)).toList();
        if(modesList.isNotEmpty) layer.mode = modesList.first;
      }

      profile.layers.addAll(loadedLayers);

    }
    return loadedProfiles;
  }

  static Future<Profile?> getOneProfile(int profileId) async {
    final Database database = await _initDatabase();
    final List<Map<String, Object?>> queryResult =
        await database.query('profiles');
    return queryResult
        .map((e) => Profile.fromMap(e))
        .toList()
        .firstWhereOrNull((element) => element.id == profileId);
  }

  //Use this to update already existing profile, otherwise create new one
  static Future<void> createProfile(Profile profile) async {
    final Database database = await _initDatabase();

    //Save profile in database
    var layers = profile.layers;
    var apps = profile.associatedApps;
    var profileMap = profile.toMap();
    profileMap.remove('layers');
    profileMap.remove('associatedApps');

    await database.insert("profiles", profileMap,
        conflictAlgorithm: ConflictAlgorithm.replace);

    //save associatedApps
    //TODO save apps in database

    //For each layer in the the profile, save the layer
    for (var layer in layers) {

      //Save layer in database
      var layerMap = layer.toMap();
      layerMap.remove('mode');
      layerMap.remove('icon');
      layerMap['profileId'] = profile.id;
      await database.insert('layers', layerMap,
          conflictAlgorithm: ConflictAlgorithm.replace);

      //Save layer icon in database
      var layerIcon = layer.icon;
      await database.insert('icons', {
        'layerId': layer.id,
        'codePoint': layerIcon.codePoint,
        'fontFamily': layerIcon.fontFamily
      });

      //Save mode in database
      var modeMap = layer.mode?.toMap();
      if (modeMap != null && modeMap.isNotEmpty) {
        modeMap['layerId'] = layer.id;
        modeMap.remove('effects');
        modeMap.remove('icon');
        var modeId = await database.insert('tools_mode', modeMap,
            conflictAlgorithm: ConflictAlgorithm.replace);

        //save mode icon in database
        var modeIcon = layer.mode?.icon;
        await database.insert('icons', {
          'modeId': modeId,
          'codePoint': modeIcon?.codePoint,
          'fontFamily': modeIcon?.fontFamily
        });

        //Save mode effect in database
        var effectMap = layer.mode?.effects.toMap();
        if (effectMap != null && effectMap.isNotEmpty) {
          effectMap['modeId'] = modeId;
          await database.insert('effects', effectMap,
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
    }
  }

  static Future<void> deleteProfile(int id) async {
    final Database database = await _initDatabase();
    try {
      await database.delete("profiles", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting a profile: $err");
    }
  }

  static onCreateDatabase(Database database, int version) async {
    await database.execute(
      "CREATE TABLE profiles("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "name VARCHAR NOT NULL)",
    );

    await database.execute(
      "CREATE TABLE layers("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "profileId INTEGER NOT NULL,"
      "parentId INTEGER,"
      "layerText VARCHAR(50) NOT NULL,"
      "visible VARCHAR(10) NOT NULL,"
      "visibleOnStack INTEGER NOT NULL,"
      "isSublayer INTEGER NOT NULL,"
      "hasSublayer INTEGER NOT NULL,"
      "listDisplayColor INTEGER,"
      "paintColor INTEGER,"
      "shortcutColor INTEGER,"
      "top DOUBLE NOT NULL,"
      "bottom DOUBLE NOT NULL,"
      "left DOUBLE NOT NULL,"
      "right DOUBLE NOT NULL,"
      "icon TEXT,"
      //"effectId NOT NULL,"
      //"keys TEXT NOT NULL,"
      "FOREIGN KEY (profileId)"
      "REFERENCES profiles (id)"
      "ON UPDATE CASCADE "
      " ON DELETE CASCADE"
      ")",
    );

    await database.execute("CREATE TABLE tools_mode("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "layerId INTEGER,"
        "currentColor VARCHAR(200),"
        "name VARCHAR(50),"
        "modeType VARCHAR(50),"
        "subMode VARCHAR(50),"
        "shortcutKeys TEXT,"
        "display VARCHAR(50),"
        "value VARCHAR(50),"
        "FOREIGN KEY (layerId) "
        "REFERENCES layers (id) "
        "ON UPDATE CASCADE "
        " ON DELETE CASCADE"
        ")");

    await database.execute("CREATE TABLE effects("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "modeId INTEGER NOT NULL,"
        "degree DOUBLE,"
        "size DOUBLE,"
        "speed DOUBLE,"
        "updatePerSecond DOUBLE,"
        "imageQuality DOUBLE,"
        "effectType VARCHAR(50),"
        "effectName VARCHAR(50),"
        "extractedColors BLOB,"
        "ImageBytes BLOB,"
        "FOREIGN KEY (modeId) "
        "REFERENCES tools_modes (id) "
        "ON UPDATE CASCADE "
        " ON DELETE CASCADE"
        ")");

    await database.execute(
      "CREATE TABLE icons("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "layerId INTEGER,"
      "modeId INTEGER,"
      "codePoint INTEGER NOT NULL,"
      "fontFamily VARCHAR(50) NOT NULL,"
      "FOREIGN KEY (modeId)"
      "REFERENCES tools_modes (id)"
      "ON UPDATE CASCADE "
      " ON DELETE CASCADE,"
      "FOREIGN KEY (layerId)"
      "REFERENCES layers (id)"
      "ON UPDATE CASCADE "
      " ON DELETE CASCADE"
      ")",
    );
  }
}
