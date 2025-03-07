import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:week_07_firebase/app_state.dart';
import 'package:week_07_firebase/pages/home_page.dart';
import 'package:week_07_firebase/pages/todos_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApplicationState appState = ApplicationState();

  runApp(MainApp(authAppState: appState));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(authAppState: authAppState),
        '/sign-in': (context) {
          return SignInScreen(
            actions: [
              AuthStateChangeAction((context, state) {
                // state has changed, find out what happened and deal with
                final user = switch (state) {
                  SignedIn state => state.user,
                  UserCreated state => state.credential.user,
                  _ => null,
                };

                if (user != null) {
                  if (state is UserCreated) {
                    // new user, update their display name to the first part
                    // their email address
                    user.updateDisplayName(user.email!.split('@').first);
                  }

                  // remove the dialog
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/');
                }
              }),
            ],
          );
        },
        '/profile': (context) {
          return ProfileScreen(
            actions: [
              SignedOutAction((context) {
                // remove the dialog
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              }),
            ],
          );
        },
        '/todos': (context) {
          return TodosPage();
        },
      },
    );
  }
}
