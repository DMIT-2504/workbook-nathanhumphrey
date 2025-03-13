import 'package:flutter/material.dart';

class SubPage2 extends StatelessWidget {
  const SubPage2({super.key});

  static const routeName = 'sub_page2';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sub Page 2'),
      ),
    );
  }
}
