import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends StatefulWidget {
  const SharedPrefs({super.key});

  @override
  State<SharedPrefs> createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {
  var _message = '';

  @override
  void initState() {
    _readFromStorage();
    super.initState();
  }

  Future<void> _readFromStorage() async {
    // Attempt to read the message from shared prefs
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _message = prefs.getString('message') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = 'Something to write';
                });

                // Write to shared preferences
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('message', _message);
              },
              child: const Text('Save a Message'),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = '';
                });

                final prefs = await SharedPreferences.getInstance();
                // Clears all shared prefs
                prefs.clear();

                // Or, you can remove just one
                // prefs.remove('message');
              },
              child: const Text('Clear Message'),
            ),
            _message.isEmpty ? const Text('Nothing to read') : Text(_message),
          ],
        ),
      ),
    );
  }
}
