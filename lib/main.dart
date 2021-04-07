import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

//insipiration https://michaeldyrynda.github.io/readme-generator/

class MyApp extends StatelessWidget {
  final title = 'Pubspec to Markdown';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHome(title: title),
    );
  }
}
