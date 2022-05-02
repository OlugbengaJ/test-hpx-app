import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DBManager {
  static const _dbUserName = "hpxapp";
  static const _dbPassword = "iSrvhODjU9bBKMn8";
  static const _connectionURL = "mongodb+srv://$_dbUserName:$_dbPassword@cluster0.oqikl.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

  DBManager._();
  static final DBManager instance = DBManager._();
  static late Db _database;

  static Db get database  {
    if (_database != null) return _database;
    _initDatabase();
    return _database;
  }

  static _initDatabase() async {
    _database = Db(_connectionURL);
    await _database.open();
  }

  static Future<List<Map<String, dynamic>>> getAllProfiles() async {
    DbCollection collection = database.collection("profiles");
    return await collection.find().toList();
  }

  static Future<Map<String, dynamic>?> getOneProfile(String profileId) async {
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
    collection.update(collection.findOne(where.eq("id", profileId)), profileData);
  }

  static Future<void> deleteProfile(Map<String, dynamic> profileData) async {
    DbCollection collection = database.collection("profiles");
    var profileId = profileData['id'];
    collection.remove(collection.findOne(where.eq("id", profileId)));
  }

  static Future<List<Map<String, dynamic>>> getAllToolsEffects() async {
    DbCollection collection = database.collection("tools_effects");
    return await collection.find().toList();
  }

  static Future<Map<String, dynamic>?> getOneToolEffect(String toolEffectId) async {
    DbCollection collection = database.collection("tools_effects");
    return await collection.findOne(where.eq("id", toolEffectId));
  }

  static Future<void> updateToolEffect(Map<String, dynamic> toolEffectData) async {
    DbCollection collection = database.collection("tools_effects");
    var tootEffectId = toolEffectData['id'];
    collection.update(collection.findOne(where.eq("id", tootEffectId)), toolEffectData);
  }
}