import 'package:flutter/material.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub1.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub2.dart';

class SubManager extends StatefulWidget {
  const SubManager({super.key});

  @override
  State<SubManager> createState() => _SubManagerState();
}

class _SubManagerState extends State<SubManager> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sub Navigation Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_navigatorKey.currentState!.canPop()) {
                _navigatorKey.currentState!.pop();
              } else {
                Navigator.of(context).pop();
              }
            },
          )),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: SubPage.routeName,
        onGenerateRoute: (settings) {
          Widget page = const Text('DEFAULT PAGE');

          switch (settings.name) {
            case SubPage.routeName:
              page = SubPage();
              break;
            case SubPage1.routeName:
              page = SubPage1();
              break;
            case SubPage2.routeName:
              page = SubPage2();
              break;
          }

          return MaterialPageRoute(
              builder: (context) => page, settings: settings);
        },
      ),
    );
  }
}
