import 'package:flutter/material.dart';
import 'package:flutter_module/common/ui_help.dart';

import 'count_mode.dart';

class InheritedWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InheritedWidgetDemoState();
  }
}

class InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int _count = 1;

  void _incerseCount() {
    print('--------------------');
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CounterProvider(
      count: _count,
      increaseCount: _incerseCount,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('InheritedWidget'),
        ),
        body: Counter(),
        floatingActionButton: FloatingActionButton(onPressed: _incerseCount),
      ),
    );
  }
}

///子Widget

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "${count}",
            style: TextStyle(
              letterSpacing: 1,
              color: UIHelp.color_2E2F33,
              fontSize: UIHelp.fontSize17,
            ),
          ),
          RaisedButton(
            child: Text("button"),
            onPressed: increaseCount,
          )
        ],
      ),
    );
  }
}
