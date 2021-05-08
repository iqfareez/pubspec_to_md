import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pubspec_to_md/utils/url_launcher.dart';
import '../utils/conversion_logic.dart';
import '../utils/enums.dart';

const headerTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.w800);
const codeTextStyle = TextStyle(
  fontFamily: 'JetBrains Mono',
);

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
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

  void dispose() {
    codeEditController.dispose();
    previewTextController.dispose();
    super.dispose();
  }

  Widget buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget buildMobileLayout() {
    return Column(
      children: [
        CodeBoxWidget(
            codeEditController: codeEditController,
            previewTextController: previewTextController,
            convert: convert),
        PreviewBoxWidget(previewTextController: previewTextController),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}

class PreviewBoxWidget extends StatefulWidget {
  const PreviewBoxWidget({
    Key key,
    @required this.previewTextController,
  }) : super(key: key);

  final TextEditingController previewTextController;

  @override
  _PreviewBoxWidgetState createState() => _PreviewBoxWidgetState();
}

class _PreviewBoxWidgetState extends State<PreviewBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Preview',
            style: headerTextStyle,
          ),
          SizedBox(height: 20),
          TextField(
            maxLines: null,
            controller: widget.previewTextController,
            style: codeTextStyle,
            readOnly: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Formatted will show here\n\n'),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                disabledColor: CupertinoColors.systemGrey3,
                child: Text(
                  'Copy',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (widget.previewTextController.text.isNotEmpty) {
                    Clipboard.setData(ClipboardData(
                            text: widget.previewTextController.text))
                        .then((value) => Fluttertoast.showToast(msg: 'Copied'));
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Empty field',
                        webBgColor:
                            "Linear-gradient(to right, #b92b27, #1565C0)",
                        timeInSecForIosWeb: 2);
                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
              CupertinoButton(
                  child: Text('Online Markdown Editor'),
                  onPressed: () =>
                      LaunchUrl.launchURL('https://markdownlivepreview.com/')),
            ],
          )
        ],
      ),
    );
  }
}

class CodeBoxWidget extends StatefulWidget {
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
  _CodeBoxWidgetState createState() => _CodeBoxWidgetState();
}

class _CodeBoxWidgetState extends State<CodeBoxWidget> {
  int _currentFormatTypeSegment = 0;
  int _currentVersionSegment = 0;
  bool _isTextEmpty;

  @override
  Widget build(BuildContext context) {
    _isTextEmpty = widget.codeEditController.text.isEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Code',
            style: headerTextStyle,
          ),
          SizedBox(height: 20),
          //https://www.developerlibs.com/2019/04/flutter-important-aspects-properties-textfield.html
          TextField(
            controller: widget.codeEditController,
            style: codeTextStyle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  'example:\ncupertino_icons: ^1.0.2\nurl_launcher: ^6.0.2',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              setState(() => _isTextEmpty = value.isEmpty);
            },
          ),
          SizedBox(height: 15),
          CupertinoSlidingSegmentedControl(
              children: <int, Widget>{
                FormatType.url.index: Text('URL'),
                FormatType.name.index: Text('Hyperlink'),
                FormatType.table.index: Text('Table'),
              },
              groupValue: _currentFormatTypeSegment,
              onValueChanged: (newValue) {
                setState(() {
                  _currentFormatTypeSegment = newValue;
                  print('newValue is ${FormatType.values[newValue]}');
                });
              }),
          SizedBox(height: 15),
          CupertinoSegmentedControl(
              children: <int, Widget>{
                0: Text(' Without version '),
                1: Text(' With version '),
              },
              groupValue: _currentVersionSegment,
              onValueChanged: (newValue) {
                setState(() {
                  _currentVersionSegment = newValue;
                  print('newValue is $newValue');
                });
              }),
          SizedBox(height: 15),
          CupertinoButton.filled(
            disabledColor: CupertinoColors.systemGrey3,
            child: Text(
              'Generate md',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: !_isTextEmpty
                ? () {
                    try {
                      widget.previewTextController.text = widget.convert
                          .convertFormattedMd(
                              widget.codeEditController.text,
                              FormatType.values[_currentFormatTypeSegment],
                              _currentVersionSegment);
                      FocusScope.of(context).unfocus();
                    } on RangeError catch (e) {
                      print('Error caught: $e');
                      Fluttertoast.showToast(
                          msg:
                              'Please re-check your code. Make sure to put package used and its version number.',
                          timeInSecForIosWeb: 3,
                          webBgColor:
                              "Linear-gradient(to right, #b92b27, #1565C0)");
                    } catch (e) {
                      print('Catched $e');
                    }
                  }
                : null,
          ),
          CupertinoButton(
              child: Text('Clear all'),
              onPressed: !_isTextEmpty
                  ? () {
                      Fluttertoast.showToast(msg: 'Cleared');
                      setState(() {
                        widget.codeEditController.clear();
                        widget.previewTextController.clear();
                        _isTextEmpty = true;
                      });
                    }
                  : null),
        ],
      ),
    );
  }
}
