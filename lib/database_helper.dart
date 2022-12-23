import 'package:assignment3_trial/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "TaskDB.db";

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
    onCreate: (db, version) async =>
    await db.execute("CREATE TABLE Tasks(id INTEGER PRIMARY KEY, title TEXT NOT NULL, details TEXT NOT NULL);"),
      version: _version
    );
  }

  static Future<int> addTask(Task task) async {
    final db = await _getDB();
    return await db.insert("Tasks", task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateTask(Task task) async {
    final db = await _getDB();
    return db.update("Tasks", task.toJson(),
        where:  'id = ?', whereArgs: [task.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<int> deleteTask(Task task) async{
    final db = await _getDB();
    return await db.delete("Tasks", where:  'id = ?', whereArgs: [task.id]);
  }
  static Future<List<Task>?> getAllTask() async{
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Tasks");

    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => Task.fromJson(maps[index]));
    }
  }
