import 'package:flutter/material.dart';
import 'package:pubspec_to_md/utils/conversion_logic.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController codeEditController = TextEditingController();
  TextEditingController previewTextController = TextEditingController();
  Conversion convert = Conversion();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Code'),
                  SizedBox(height: 20),
                  //https://www.developerlibs.com/2019/04/flutter-important-aspects-properties-textfield.html
                  TextField(
                    controller: codeEditController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                      child: Text(
                        'Generate md',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        convert.convertFormattedMd(codeEditController.text);
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Preview'),
                  SizedBox(height: 20),
                  TextField(
                    controller: previewTextController,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
