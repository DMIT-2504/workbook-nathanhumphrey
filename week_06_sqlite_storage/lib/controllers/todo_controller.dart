import 'package:sqflite/sqflite.dart';
import 'package:week_06_sqlite_storage/models/todo.dart';
import 'package:week_06_sqlite_storage/services/db.dart';

class TodoController {
  static Database? _db;
  static const TodoController instance = TodoController._();
  static const tableName = 'todos';

  // private constructor
  const TodoController._();

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await getDatabase();
    return _db!;
  }

  Future<void> insert(Todo todo) async {
    final db = await database;
    await db.insert(
      tableName,
      todo.toMap(),
    );
  }

  Future<void> update(Todo todo) async {
    final db = await database;
    await db.update(
      tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteAll() async {
    final db = await database;
    await db.delete(tableName);
  }

  Future<List<Todo>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        description: maps[i]['description'],
        done: maps[i]['done'] == 1,
      );
    });
  }
}
