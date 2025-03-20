import 'dart:math' as math;

import 'package:flutter/material.dart';

class TransformsPage extends StatelessWidget {
  const TransformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transforms Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 30 * (math.pi / 180),
              child: const Text('Transform Text'),
            ),
            SizedBox(height: 24.0),
            Transform.scale(
              scale: 2.0,
              child: Transform.translate(
                offset: Offset(32.0, 48.0),
                child: Transform.rotate(
                  angle: -30 * (math.pi / 180),
                  child: const Text('Transform Text'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
