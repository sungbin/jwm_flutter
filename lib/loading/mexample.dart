import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:jwm/format/infomation.dart';

import '../car_view.dart';

class Mexample extends StatefulWidget {
  _MexampleState createState() => _MexampleState();
}

String car_info_url = 'http://115.138.171.148:40080/data/data.json';

class _MexampleState extends State<Mexample> {
  Information info = null;
  void initState() {
    super.initState();
    _fetch(car_info_url);
    Timer(Duration(seconds: 2), () {
      // Navigator.of(context).pop();
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => CarView(info: info),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 2000),
          )
          // MaterialPageRoute(builder: (context) => CarView(info: info)),
          );
    });
  }

  String _html;
  int _len = 0;
  void _fetch(String link) async {
    final http.Response response = await http.get(link);
    log(response.statusCode.toString());
    setState(() {
      _html = utf8.decode(response.bodyBytes);
      info ??= Information(_html);
    });
  }

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
