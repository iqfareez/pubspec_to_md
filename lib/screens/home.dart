import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pubspec_to_md/utils/url_launcher.dart';
import 'main_screen.dart';

class MyHome extends StatelessWidget {
  MyHome({this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('V${snapshot.data.version}')],
                );
              } else {
                return SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(width: 15),
          TextButton.icon(
            onPressed: () => LaunchUrl.launchURL(
                'https://github.com/iqfareez/pubspec_to_md'),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
              child: Text('Paste your pubspec dependencies code below'),
            ),
            InputScreen(),
          ],
        ),
      ),
    );
  }
}
