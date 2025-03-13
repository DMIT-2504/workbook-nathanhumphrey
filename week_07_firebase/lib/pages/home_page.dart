import 'package:flutter/material.dart';
import 'package:week_07_firebase/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth Demo')),
      body: ListenableBuilder(
        listenable: authAppState,
        builder: (context, child) {
          return authAppState.loggedIn
              ? Column(
                children: [
                  ElevatedButton(
                    onPressed:
                        () => Navigator.of(context).pushNamed('/profile'),
                    child: const Text('Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/todos'),
                    child: const Text('Todos'),
                  ),
                ],
              )
              : ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/sign-in'),
                child: const Text('Sign In'),
              );
        },
      ),
    );
  }
}
