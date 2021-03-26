import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:jwm/format/infomation.dart';

class Mexample extends StatefulWidget {
  _MexampleState createState() => _MexampleState();
}

String car_info_url = 'http://115.138.171.148:40080/data/data.json';

class _MexampleState extends State<Mexample> {
  void initState() {
    super.initState();
    _fetch(car_info_url);
    Timer(Duration(seconds: 5), () => print('done'));
  }

  String _html;
  int _len = 0;
  Information info = null;
  void _fetch(String link) async {
    final http.Response response = await http.get(link);
    log(response.statusCode.toString());
    setState(() {
      _html = utf8.decode(response.bodyBytes);
      info ??= Information(_html);
    });
  }

// TODO: spanish screenshot
  @override
  Widget build(BuildContext context) {
    // log(info.user['jwm1992'].selled_car_list.toString());
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Image.asset(
            'asset/jwm_loading.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: FractionalOffset(0.5, 0.82),
          child: Container(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
