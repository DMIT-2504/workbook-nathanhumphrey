import 'package:flutter/material.dart';

class SubPage1 extends StatelessWidget {
  const SubPage1({super.key});

  static const routeName = 'sub_page1';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sub Page 1'),
      ),
    );
  }
}
