import 'package:flutter/material.dart';
import 'package:week_04_stateful_widget/widgets/random_dog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: RandomDog(),
          ),
        ),
      ),
    );
  }
}
