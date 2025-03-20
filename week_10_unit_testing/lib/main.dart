import 'package:flutter/material.dart';
import 'package:week_10_unit_testing/models/user.dart';
import 'package:week_10_unit_testing/widgets/user_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserWidget(user: User(name: 'Jane Doe', email: 'jdoe@example.com')),
    );
  }
}
