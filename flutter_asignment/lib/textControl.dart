import 'package:flutter/material.dart';

import './textOutput.dart';

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  var _mainText = 'This is the first text';

  void onChangeText() {
    setState(() {
      _mainText = 'This changed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Change Text'),
          onPressed: onChangeText,
        ),
        TextOutput(_mainText),
      ],
    );
  }
}