import 'package:flutter/material.dart';
import 'package:pubspec_to_md/screens/main_screen.dart';

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Paste your packages in your readme'),
          MainScreen(),
        ],
      ),
    );
  }
}
