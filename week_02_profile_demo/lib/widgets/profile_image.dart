import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;

  const ProfileImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}
