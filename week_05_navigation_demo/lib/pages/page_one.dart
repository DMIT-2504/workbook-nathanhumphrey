import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({required this.displayMessage, super.key});

  static const routeName = 'page_one';

  final String displayMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop<String>('Return from appBar');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Page One'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Page one body'),
            Text('The displayMessage: $displayMessage'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<String>('Return from button');
              },
              child: const Text('Return Home'),
            ),
          ],
        ),
      ),
    );
  }
}
