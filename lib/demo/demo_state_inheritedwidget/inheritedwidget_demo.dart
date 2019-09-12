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
    return CountContainer(
      count: _count,
      increaseCount: _incerseCount,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('InheritedWidget'),
        ),
        body: new Column(
          children: <Widget>[
            Counter(),
            new Container(
              child: new Column(
                children: <Widget>[
                  Text(
                    "父容器",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: UIHelp.color_2E2F33,
                      fontSize: UIHelp.fontSize17,
                    ),
                  ),
                  RaisedButton(
                    child: Text("父容器Button"),
                    onPressed: _incerseCount,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


///子Widget
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CountContainer.of(context).count;
    final VoidCallback increaseCount = CountContainer.of(context).increaseCount;
    return Container(
      margin: EdgeInsets.all(20),
      color: UIHelp.color_D0BBFF,
      width: 300,
      height: 200,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "容器里面的子Widget",
            style: TextStyle(
              letterSpacing: 1,
              color: UIHelp.color_FFFFFF,
              fontSize: UIHelp.fontSize17,
            ),
          ),
          Text(
            "${count}",
            style: TextStyle(
              letterSpacing: 1,
              color: UIHelp.color_2E2F33,
              fontSize: UIHelp.fontSize17,
            ),
          ),
          RaisedButton(
            child: Text("子容器Button"),
            onPressed: increaseCount,
          ),
        ],
      ),
    );
  }
}
