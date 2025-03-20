import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;

  const ProfileImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 4.0,
        ),
      ),
    );
    // Original image display
    // return ClipOval(
    //   child: Image.asset(
    //     imagePath,
    //     width: 200.0,
    //     height: 200.0,
    //   ),
    // );
  }
}
