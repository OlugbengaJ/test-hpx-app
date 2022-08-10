import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';

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
    List<Profile> profileObjects = [];
    final Database database = await _initDatabase();
    final List<Map<String, Object?>> profilesQueryResult =
    await database.query('profiles');

    //workaround to avoid unmodifiable map
    var profilesMap = jsonDecode(jsonEncode(profilesQueryResult));

    //for each profile load its layers
    for (var profile in profilesMap) {
      final List<Map<String, Object?>> layersQueryResult =
      await database.rawQuery("SELECT * FROM layers "
          " WHERE profileId = ${profile['id']}");

      //workaround to avoid unmodifiable map
      var layersMap = jsonDecode(jsonEncode(layersQueryResult));

      //for each layer, load its mode
      for (var layer in layersMap) {
        final List<Map<String, dynamic>> iconQueryResult = await database
            .query('icons', where: "layerId = ?", whereArgs: [layer['id']]);
        layer['icon'] = iconQueryResult.first;
        final List<Map<String, dynamic>> modeQueryResult = await database
            .rawQuery("SELECT * from tools_mode where layerId=${layer['id']}");

        //for each mode, load its effect
        if (modeQueryResult.isNotEmpty) {
          List<dynamic> toolsModeMap = jsonDecode(jsonEncode(modeQueryResult));
          for (var toolsMode in toolsModeMap) {
            final List<Map<String, dynamic?>> effectsQueryResult =
            await database.query('effects',
                where: "modeId = ?", whereArgs: [toolsMode['id']]);
            toolsMode['effects'] = effectsQueryResult.first;

            final List<Map<String, dynamic?>> modeIconQueryResult =
            await database.query('icons',
                where: "modeId = ?", whereArgs: [toolsMode['id']]);
            toolsMode['icon'] = modeIconQueryResult.first;
          }
          layer['mode'] = toolsModeMap.first;
        }
      }
      profile['layers'] = layersMap;
      profileObjects.add(Profile.fromJson(profile));
    }

    return profileObjects;
  }

  //Use this to update already existing profile, otherwise create new one
  static Future<void> createProfile(Profile profile) async {
    final Database database = await _initDatabase();

    //Save profile in database
    var layers = profile.layers;
    var associatedApps = profile.associatedApps;
    var profileMap = profile.toMap();
    profileMap.remove('layers');
    profileMap.remove('associatedApps');

    if(await rawWithIdExists('profiles', profile.id)) {
      await database.update('profiles', profileMap, where: "id = ?", whereArgs: [profile.id]);
    } else {
      await database.insert("profiles", profileMap);
    }

    //save associatedApps
    for (var app in associatedApps) {
      var appMap = app.toJson();
      appMap['profileId'] = profile.id;
      await database.insert('associatedApps', appMap,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    //For each layer in the the profile, save the layer
    for (var layer in layers) {
      //Save layer in database
      var layerMap = layer.toJson();
      layerMap.remove('mode');
      layerMap.remove('icon');
      layerMap['profileId'] = profile.id;

      if(await rawWithIdExists('layers', layerMap['id'])) {
        await database.update('layers', layerMap, where: "id = ?", whereArgs: [layer.id]);
      } else {
        await database.insert('layers', layerMap);
      }

      //Save layer icon in database
      Map<String, dynamic> layerIconMap = layer.toJson()['icon'];
      layerIconMap['layerId'] = layer.id;
      await database.insert('icons', layerIconMap,
          conflictAlgorithm: ConflictAlgorithm.replace);


      //Save mode in database
      var modeMap = layer.mode?.toJson();
      if (modeMap != null && modeMap.isNotEmpty) {
        modeMap['layerId'] = layer.id;
        modeMap.remove('effects');
        modeMap.remove('icon');

        var modeId = await database.insert('tools_mode', modeMap,
            conflictAlgorithm: ConflictAlgorithm.replace);

        //save mode icon in database
        Map<String, dynamic> modeIconMap = layer.mode?.toJson()['icon'];
        modeIconMap['modeId'] = modeId;
        await database.insert('icons', modeIconMap,
            conflictAlgorithm: ConflictAlgorithm.replace);

        //Save mode effect in database
        var effectMap = layer.mode?.effects.toJson();
        if (effectMap != null && effectMap.isNotEmpty) {
          effectMap['modeId'] = modeId;
          await database.insert('effects', effectMap,
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
    }
  }

  static Future<void> deleteItem(String tableName, int id) async {
    final Database database = await _initDatabase();
    try {
      await database.delete(tableName, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting a profile: $err");
    }
  }

  static Future<int> getNextAvailableId(String table) async {
    var count = 0;
    await Future.doWhile(() async {
      count++;
      return await rawWithIdExists(table, count);
    });
    return count;
  }

  static Future<bool> rawWithIdExists(String table, int? id) async {
    if(id == null) return false;
    final Database database = await _initDatabase();
    var result = await database.rawQuery(
      'SELECT EXISTS (SELECT 1 FROM $table WHERE id=$id)',
    );

    var exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }

  static onCreateDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE profiles("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name VARCHAR NOT NULL, "
        "icon VARCHAR, "
        "createdDate  VARCHAR)");

    await database.execute("CREATE TABLE layers("
        "id INTEGER PRIMARY KEY, "
        "profileId INTEGER NOT NULL,"
        "parentId INTEGER,"
        "layerText VARCHAR(50) NOT NULL,"
        "visible INTEGER NOT NULL,"
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
        "FOREIGN KEY (profileId)"
        "REFERENCES profiles (id)"
        "ON UPDATE CASCADE "
        " ON DELETE CASCADE"
        ")");

    await database.execute("CREATE TABLE tools_mode("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "layerId INTEGER UNIQUE,"
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
        "modeId INTEGER UNIQUE,"
        "degree DOUBLE,"
        "size DOUBLE,"
        "speed DOUBLE,"
        "updatePerSecond DOUBLE,"
        "imageQuality DOUBLE,"
        "effectType VARCHAR(50),"
        "effectName VARCHAR(50),"
        "extractedColors BLOB,"
        "imageBytes BLOB,"
        "FOREIGN KEY (modeId) "
        "REFERENCES tools_modes (id) "
        "ON UPDATE CASCADE "
        " ON DELETE CASCADE"
        ")");

    await database.execute("CREATE TABLE icons("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "layerId INTEGER UNIQUE,"
        "modeId INTEGER UNIQUE,"
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
        ")");

    await database.execute("CREATE TABLE associatedApps("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "profileId INTEGER,"
        "name VARCHAR(50),"
        "file VARCHAR, "
        "icon VARCHAR, "
        "createdDate  VARCHAR, "
        "FOREIGN KEY (profileId)"
        "REFERENCES profiles (id) "
        " ON UPDATE CASCADE "
        " ON DELETE CASCADE"
        ")");
  }
}