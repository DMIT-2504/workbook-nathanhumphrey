import 'package:flutter/material.dart';
import 'package:week_02_profile_demo/widgets/page_heading.dart';
import 'package:week_02_profile_demo/widgets/profile_detail.dart';
import 'package:week_02_profile_demo/widgets/profile_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const themeSwatch = Colors.blue;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: themeSwatch,
      primary: themeSwatch.shade900,
      onPrimary: themeSwatch.shade100,
      // Check out all the other properties you can set
    );

    final textColor = colorScheme.primary;

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: textColor,
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile - A Demo App'),
        ),
        body: const Column(
          children: <Widget>[
            PageHeading(title: 'Employee profile'),
            ProfileImage(imagePath: 'assets/images/me.jpg'),
            // TODO: create a ProfileDetail(label: 'Name', value: 'Jane Doe')
            // Once complete, replace the following Rows with the new widget
            ProfileDetail(label: 'Name', value: 'Nathan'),
            ProfileDetail(label: 'Position', value: 'Instructor'),
            ProfileDetail(label: 'Reports to', value: 'Steve'),
          ],
        ),
      ),
    );
  }
}
