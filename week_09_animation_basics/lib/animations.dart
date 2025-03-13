import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  var x = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    _controller.value < 0.5 ? (x += 2) : (x -= 2),
                    0.0,
                  ),
                  child: Transform.rotate(
                    angle: _controller.value * (math.pi * 2),
                    child: const Text('Explicit Animation'),
                  ),
                );
              },
            ),
            RotationTransition(
              //turns: _controller,
              turns: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              ),
              child: const Text('Implicit Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
