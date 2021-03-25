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
  }

  String _html;
  int _len = 0;
  void _fetch(String link) async {
    final http.Response response = await http.get(link);
    log(response.statusCode.toString());
    setState(() {
      _html = utf8.decode(response.bodyBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    Information info = Information(_html);
    log(info.user['jwm1992'].selled_car_list.toString());
    Text html_t = Text(
      _html,
      // info.user['jwm1992'].selled_car_list.toString(),
      style: TextStyle(
        fontSize: 12,
      ),
    );
    return Expanded(
        flex: 1,
        child: SingleChildScrollView(
            child: html_t, scrollDirection: Axis.vertical));
  }
}
