import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwm/car_view.dart';
import 'dart:developer';

import 'format/infomation.dart';
import 'loading/loading.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String car_info_url = 'http://115.138.171.148:40080/data/data.json';
  Information info = null;
  String _html;
  int _len = 0;
  Future<Information> _fetch(String link) async {
    final http.Response response = await http.get(link);
    _html = utf8.decode(response.bodyBytes);
    return Information(_html);
  }

  @override
  Widget build(BuildContext context) {
    Widget splash = Loading();
    Information _info;

    _fetch(car_info_url).then((info) {
      _info = info;
    });
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => splash,
        '/home': (BuildContext context) => CarView(_info),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
                onPressed: () {
                  log('clicked!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loading()),
                  );
                },
                child: Text('Next Page'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
