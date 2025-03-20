import 'package:flutter/material.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub1.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub2.dart';

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  static const routeName = 'sub_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Main Sub Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SubPage1.routeName);
              },
              child: const Text('Sub 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SubPage2.routeName);
              },
              child: const Text('Sub 2'),
            ),
          ],
        ),
      ),
    );
  }
}
