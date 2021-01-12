import 'package:flutter/material.dart';
import 'package:pubspec_to_md/screens/entry_point.dart';

void main() {
  runApp(MyApp());
}

//insipiration https://michaeldyrynda.github.io/readme-generator/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pubspec to Readme (Beta)',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUBSPEC to README BETA'),
      ),
      body: EntryPoint(),
    );
  }
}
