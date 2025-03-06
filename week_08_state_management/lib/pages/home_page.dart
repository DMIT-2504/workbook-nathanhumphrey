import 'package:flutter/material.dart';
import 'package:week_08_state_management/models/user.dart';

import 'first_name_page.dart';
import 'last_name_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) : user = User('Jane', 'Doe');

  // App state
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FirstNamePage(),
                    ),
                  ),
              child: const Text('First Name Page'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LastNamePage(),
                    ),
                  ),
              child: const Text('Last Name Page'),
            ),
          ],
        ),
      ),
    );
  }
}
