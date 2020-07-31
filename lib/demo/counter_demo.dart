import 'dart:async';

import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  MyCounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCounterPageState createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int _counter = 11;

  void _incrementCounter() =>
      setState(() {
        _counter++;
      });

  @override
  Widget build(BuildContext context) {
    main();
    return Scaffold(
        appBar: AppBar(title: Text("计数器")),
        body: new Center(
          child: Text('You have pushed the button this many times:$_counter'),
        ),
        floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.add), onPressed: _incrementCounter));
  }
}

void main() {
  print('flow start');
  Timer.run(() {
    print('event');
    // 在事件任务创建一个微任务，添加到微任务队列 
    scheduleMicrotask(() {
      print('microtask in event');
    });
  });

  scheduleMicrotask(() {
    print('microtask');
    // 在微任务里面创建事件任务，添加到事件任务队列 
    Timer.run(() {
      print('event in microtask');
    });
  });
  print('flow end');
}