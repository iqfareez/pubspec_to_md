import 'package:flutter/material.dart';
import 'main_screen.dart';

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
            child: Text('Paste your pubspec dependencies code below'),
          ),
          MainScreen(),
        ],
      ),
    );
  }
}
