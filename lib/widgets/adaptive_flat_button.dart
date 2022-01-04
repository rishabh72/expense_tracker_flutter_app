import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function onClick;

  AdaptiveFlatButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? (CupertinoButton(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onClick))
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: onClick,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
