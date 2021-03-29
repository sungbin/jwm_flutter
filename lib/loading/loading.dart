import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jwm/format/infomation.dart';

class Loading extends StatefulWidget {
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Information info = null;
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(
        context,
        '/home',
      );
    });
  }

  String _html;
  int _len = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Image.asset(
            'asset/jwm_loading.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
