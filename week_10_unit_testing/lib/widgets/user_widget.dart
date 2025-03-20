import 'package:flutter/material.dart';
import 'package:week_10_unit_testing/models/user.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({required this.user, super.key});

  final User user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  var isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testing Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
      body:
          isHidden
              ? const Text('User Info Hidden')
              : Column(
                children: [
                  Text('Name: ${widget.user.name}'),
                  Text('Mail: ${widget.user.email}'),
                ],
              ),
    );
  }
}
