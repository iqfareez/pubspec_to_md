import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return buildWideLayout();
          } else {
            return buildMobileLayout();
          }
        },
      ),
    );
  }

  Row buildWideLayout() {
    return Row(
      children: [
        Expanded(
          child: CodeBoxWidget(
              codeEditController: codeEditController,
              previewTextController: previewTextController,
              convert: convert),
        ),
        Expanded(
          child: PreviewBoxWidget(previewTextController: previewTextController),
        ),
      ],
    );
  }

  Column buildMobileLayout() {
    return Column(
      children: [
        CodeBoxWidget(
            codeEditController: codeEditController,
            previewTextController: previewTextController,
            convert: convert),
        PreviewBoxWidget(previewTextController: previewTextController),
      ],
    );
  }
}

class PreviewBoxWidget extends StatelessWidget {
  const PreviewBoxWidget({
    Key key,
    @required this.previewTextController,
  }) : super(key: key);

  final TextEditingController previewTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Preview'),
          SizedBox(height: 20),
          TextField(
            maxLines: null,
            controller: previewTextController,
            readOnly: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Formatted will show here\n\n'),
          ),
          SizedBox(
            height: 15,
          ),
          FlatButton(
            child: Text(
              'Copy',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: previewTextController.text))
                  .then((value) => Fluttertoast.showToast(msg: 'Copied'));
            },
          )
        ],
      ),
    );
  }
}

class CodeBoxWidget extends StatelessWidget {
  const CodeBoxWidget({
    Key key,
    @required this.codeEditController,
    @required this.previewTextController,
    @required this.convert,
  }) : super(key: key);

  final TextEditingController codeEditController;
  final TextEditingController previewTextController;
  final Conversion convert;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              hintText:
                  'example:\ncupertino_icons: ^1.0.1\nurl_launcher: ^5.7.10',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          SizedBox(
            height: 15,
          ),
          FlatButton(
            child: Text(
              'Generate md',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              previewTextController.text =
                  convert.convertFormattedMd(codeEditController.text);
            },
          )
        ],
      ),
    );
  }
}
