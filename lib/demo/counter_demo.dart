import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  MyCounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCounterPageState createState() => _MyCounterPageState();
}


class _MyCounterPageState extends State<MyCounterPage> {
  int _counter = 11;

  void _incrementCounter() => setState(() {
    for (int i = 0; i < 100; i++) {
      print("111$i");
    }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("计数器")),
        body: new Center(
          child: Text('You have pushed the button this many times:$_counter'),
        ),
        floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: _incrementCounter));
  }
}
