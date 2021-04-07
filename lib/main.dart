import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/entry_point.dart';

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

class MyHome extends StatelessWidget {
  MyHome({this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          TextButton.icon(
            onPressed: () {
              launchURL('https://github.com/iqfareez/pubspec_to_md');
            },
            icon: Icon(
              Icons.code,
              color: Colors.white,
            ),
            label: Text(
              'GitHub',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: EntryPoint(),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
