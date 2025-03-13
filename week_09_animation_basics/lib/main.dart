import 'package:flutter/material.dart';
import 'package:week_09_animation_basics/animations.dart';
import 'package:week_09_animation_basics/transforms.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TransformsPage()),
                  );
                },
                child: const Text('Transforms Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimationsPage()),
                  );
                },
                child: const Text('Animations Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
