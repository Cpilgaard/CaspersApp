import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'soundfile.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;

  String soundFileTable = 'soundfile_table';
  String colId = 'id';
  String colFilepath = 'filepath';
  String colImagepath = 'imagepath';
  String colTitle = 'title';
  String colDescription = 'description';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'soundfiles.db';

    // Open/create the database at a given path
    var soundfilesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return soundfilesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $soundFileTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colFilepath TEXT, $colImagepath TEXT, $colTitle TEXT, '
        '$colDescription TEXT)');
  }

  Future <List<Map<String, dynamic>>> getSoundfileMapList() async {
    Database db = await this.database;

    var result = await db.query(soundFileTable, orderBy: '$colId');
    return result;
  }

  Future<int> insertSoundfile(SoundFile soundFile) async {
    Database db = await this.database;
    var result = await db.insert(soundFileTable, soundFile.toMap());
    return result;
  }

  // Do not think I need to update
  /*Future<int> updateSoundfile(SoundFile soundFile) async {
    
  }*/

  Future<int> deleteSoundfile(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $soundFileTable WHERE $colId = $id');
    return result;    
  }
  
  //Get number of soundFiles in DB
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $soundFileTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //Get the 'Map list' and convert it to a soundfile list [List<Soundfile>]
  Future<List<SoundFile>> getSoundfileList() async {

    var soundfileMapList = await getSoundfileMapList();
    int count = soundfileMapList.length;

    List<SoundFile> soundfileList = List<SoundFile>();
    // For loop to create a soundfile list from a map list
    for (int i = 0; i < count; i++ ) {
      soundfileList.add(SoundFile.fromMapObject(soundfileMapList[i]));
    }
    return soundfileList;
  }



}