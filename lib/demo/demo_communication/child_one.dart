import 'package:flutter/material.dart';
import 'package:flutter_module/common/eventBus.dart';

class childOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return childOneSatte();
  }
}

class childOneSatte extends State<childOne> {
  String data = '';

  @override
  void initState() {
    // 监测类变化
    eventBus.on<TransEvent>().listen((TransEvent data) => show(data.text));
    super.initState();
  }
  void show(String val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(bottom: 15),
            child: new Text(
              '我是子组件1',
              style: TextStyle(fontSize: 15),
            ),
          ),

          new Text(
            '子组件2传过来的值' + '$data',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
