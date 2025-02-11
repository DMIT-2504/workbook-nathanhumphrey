import 'package:flutter/material.dart';
import 'package:week_05_navigation_demo/pages/home.dart';
import 'package:week_05_navigation_demo/pages/page_one.dart';
import 'package:week_05_navigation_demo/pages/page_two.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub.dart';
import 'package:week_05_navigation_demo/pages/sub_pages/sub_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      onGenerateRoute: (settings) {
        MaterialPageRoute? page;

        switch (settings.name) {
          case Home.routeName:
            page = MaterialPageRoute(builder: (context) => const Home());
            break;
          case PageOne.routeName:
            String messageArg = settings.arguments as String;
            page = MaterialPageRoute(
                builder: (context) => PageOne(
                      displayMessage: messageArg,
                    ));
            break;
          case PageTwo.routeName:
            page = MaterialPageRoute(builder: (context) => const PageTwo());
            break;
          case SubPage.routeName:
            page = MaterialPageRoute(
              builder: (context) => const SubManager(),
            );
        }

        return page;
      },
      // Simple named routes, no args
      // routes: {
      //   Home.routeName: (context) => const Home(),
      //   PageOne.routeName: (context) => const PageOne(
      //         displayMessage: 'Default Display',
      //       ),
      //   PageTwo.routeName: (context) => const PageTwo(),
      // },
      // Original home page display
      // home: Home(),
    );
  }
}
