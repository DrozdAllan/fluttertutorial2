import 'dart:async';

import 'package:fluttertutorial2/data/models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDb {
  // Singleton
  SqfliteDb._privateConstructor();
  static final SqfliteDb instance = SqfliteDb._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await init();

  static Future<Database> init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'dog_database.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'),
      version: 1,
    );
  }

  Future<List<Dog>> getDogs() async {
    Database db = await instance.database;
    List<Map<String, Object?>> maps = await db.query('dogs', orderBy: 'name');
    return List.generate(maps.length, (i) => Dog.fromMap(maps[i]));
  }

  Future<int> addDog(Dog dog) async {
    Database db = await instance.database;
    return await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> removeDog(int id) async {
    Database db = await instance.database;
    return await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateDog(Dog dog) async {
    Database db = await instance.database;
    return await db
        .update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }
}
