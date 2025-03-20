import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week_07_firebase/models/todo.dart';
import 'package:week_07_firebase/services/db.dart';

class TodoController {
  static FirebaseFirestore? _db;
  static const TodoController instance = TodoController._();
  static const tableName = 'todos';

  // private constructor
  const TodoController._();

  Future<FirebaseFirestore> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await getDatabase();
    return _db!;
  }

  // Future<void> insert(Todo todo) async {
  //   final db = await database;
  //   await db.insert(
  //     tableName,
  //     todo.toFirestore(),
  //   );
  // }

  Future<void> update(Todo todo) async {
    // User must be logged in
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('Cannot update todo when user is null');
    }

    final db = await database;

    await db
        .collection('/$tableName/${user.uid}/$tableName')
        .doc(todo.id)
        .update(todo.toFirestore());
  }

  // Future<void> deleteAll() async {
  //   final db = await database;
  //   await db.delete(tableName);
  // }

  Future<List<Todo>> getTodos() async {
    // User must be logged in
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('Cannot fetch todos when user is null');
    }

    final db = await database;

    final snapshot =
        await db.collection('/$tableName/${user.uid}/$tableName').get();

    final todos =
        snapshot.docs.map((doc) {
          return Todo(
            id: doc.id,
            description: doc['description'],
            done: doc['done'],
          );
        }).toList();

    return todos;
  }
}
