import 'dart:ui';

import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {
  String? _title;
  String? _content;
  String? _yes;
  String? _no;
  Function? _yesOnPressed;
  Function? _noOnPressed;

  BaseAlertDialog(
      {required String title,
      required String content,
      required Function yesOnPressed,
      required Function noOnPressed,
      String yes = "Yes",
      String no = "No"}) {
    _title = title;
    _content = content;
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: Text(_title!),
        content: Text(_content!),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: <Widget>[
          ElevatedButton(
            child: Text(_yes!),
            onPressed: () {
              _yesOnPressed!();
            },
          ),
          ElevatedButton(
            child: Text(_no!),
            onPressed: () {
              _noOnPressed!();
            },
          ),
        ],
      ),
    );
  }
}
