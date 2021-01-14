import 'package:flutter/material.dart';
import 'package:pubspec_to_md/screens/main_screen.dart';

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Paste your external dependencies code below'),
          ),
          MainScreen(),
        ],
      ),
    );
  }
}