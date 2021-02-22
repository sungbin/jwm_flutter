import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

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
    _html = getHtml(link1);
  }

  Future<String> _html;
  Future<String> getHtml(link) async {
    http.Response response = await http.get(link);
    log(response.statusCode.toString());
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _html,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            log(snapshot.data);
            return Text(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
