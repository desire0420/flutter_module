import 'package:flutter/material.dart';
import 'package:flutter_module/common/ui_help.dart';

class InheritedWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InheritedWidgetDemoState();
  }
}

class InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int _count = 0;

  void _incerseCount() {
    print('--------------------');
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InheritedWidget'),
      ),
      body: Counter(
        count: _count,
        increaseCount: _incerseCount,
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incerseCount),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

   //父布局传递increaseCount回调给子目录
  const Counter({Key key, this.count, this.increaseCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
