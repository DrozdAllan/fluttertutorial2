import 'dart:async';
import 'package:fluttertutorial2/data/models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDb {
  static Database? _database;

  static Future<Database> init() async {
    return _database = await openDatabase(
      join(await getDatabasesPath(), 'dog_database.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'),
      version: 1,
    );
  }

  static Future<List<Dog>> getDogs() async {
    List<Map<String, Object?>> maps =
        await _database!.query('dogs', orderBy: 'name');
    return List.generate(maps.length, (i) => Dog.fromMap(maps[i]));
  }

  static Future<int> addDog(Dog dog) async {
    return await _database!.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> removeDog(int id) async {
    return await _database!.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateDog(Dog dog) async {
    return await _database!
        .update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }
}
