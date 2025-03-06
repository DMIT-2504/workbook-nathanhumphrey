import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_08_state_management/models/user.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User('Sally', 'Anne'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: HomePage())));
  }
}
