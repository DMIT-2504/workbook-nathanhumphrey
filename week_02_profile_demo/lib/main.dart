import 'package:flutter/material.dart';
import 'package:week_02_profile_demo/widgets/page_heading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile - A Demo App'),
        ),
        body: Column(
          children: <Widget>[
            const PageHeading(title: 'Employee Profile'),
            ClipOval(
              child: Image.asset(
                'images/me.jpg',
                width: 200.0,
                height: 200.0,
              ),
            ),
            const Row(
              children: [
                Text('Row El 1'),
                Text('Row El 2'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
