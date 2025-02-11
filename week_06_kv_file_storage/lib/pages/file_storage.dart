import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage extends StatefulWidget {
  const FileStorage({super.key});

  @override
  State<FileStorage> createState() => _FileStorageState();
}

class _FileStorageState extends State<FileStorage> {
  var _message = '';

  @override
  void initState() {
    _readFromStorage();
    super.initState();
  }

  /// Utilize [path_provider] to get access to the
  /// documents directory to store a local file
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    // Hard-coded filename, doesn't have to be that way
    return File('${directory.path}/storage.txt');
  }

  Future<void> _readFromStorage() async {
    final file = await _localFile;

    var contents = '';

    if (await file.exists()) {
      contents = await file.readAsString();
    }

    setState(() {
      _message = contents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Storage'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = 'Something to write';
                });

                // Write to the local file
                final file = await _localFile;
                await file.writeAsString(_message);
              },
              child: const Text('Save a Message'),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = '';
                });

                // Write to the local file
                final file = await _localFile;
                await file.writeAsString(_message);
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
