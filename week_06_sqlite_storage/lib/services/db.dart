import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const databaseName = 'todos.db';

Future<Database> getDatabase() async {
  var databasePath = await getDatabasesPath();

  return openDatabase(
    join(databasePath, databaseName),
    version: 1,
    onCreate: (db, version) async {
      // When the database is created, creat the todos table
      await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY,
            description TEXT,
            done INTEGER DEFAULT 0
          )
      ''');
    },
  );
}
