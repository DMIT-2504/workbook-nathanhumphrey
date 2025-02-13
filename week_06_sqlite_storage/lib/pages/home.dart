import 'package:flutter/material.dart';
import 'package:week_06_sqlite_storage/controllers/todo_controller.dart';
import 'package:week_06_sqlite_storage/models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> _todos = [];
  late int _counter;
  late TodoController _controller;

  @override
  void initState() {
    _controller = TodoController.instance;
    // Fetch the todos
    _fetchTodos();
    super.initState();
  }

  Future<void> _fetchTodos() async {
    final todos = await _controller.getTodos();
    setState(() {
      _todos = todos;
      _counter = todos.length;
    });
  }

  Future<void> _addTodo(Todo todo) async {
    await _controller.insert(todo);
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _addTodo(
            Todo(
              description: 'Todo $_counter',
              done: false,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            _todos.isEmpty
                ? const Text('No todos')
                : Text('Found $_counter todos')
          ],
        ),
      ),
    );
  }
}
