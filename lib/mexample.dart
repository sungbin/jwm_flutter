import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';

class Mexample extends StatefulWidget {
  _MexampleState createState() => _MexampleState();
}

String link1 =
    "http://www.encar.com/dc/dc_carsearchlist.do?method=sellcar&userId=jwm1992&carid=28890745&WT.hit=Search_%B8%C5%B9%B0%BA%B8%B1%E2#!";
String link2 =
    "http://www.encar.com/dc/dc_carsearchlist.do?method=sellcar&userId=pwr01000&carid=28202014&WT.hit=Search_%B8%C5%B9%B0%BA%B8%B1%E2#!";

class _MexampleState extends State<Mexample> {
  void initState() {
    super.initState();
    _fetch(link1);
  }

  String _html;
  int _len = 0;
  void _fetch(String link) async {
    final http.Response response = await http.get(link);
    log(response.statusCode.toString());
    setState(() {
      _html = response.body;
      _len = response.body.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Text html_t = Text(
      'length = $_len \n' + _html,
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
