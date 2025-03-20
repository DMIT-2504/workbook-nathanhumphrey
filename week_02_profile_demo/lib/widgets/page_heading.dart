import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;

  const PageHeading({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Lobster',
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
