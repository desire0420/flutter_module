import 'package:flutter/material.dart';

//如何在布局中添加或删除组件
class StartLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StartLayoutDemo();
  }
}

class StartLayoutDemo extends State<StartLayout> {
  bool toggle = true;

  void toggle1() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
        onPressed: null,
        child: new Text(
          "改变后的文字",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        padding: EdgeInsets.all(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
          child: getToggleChild(),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: toggle1,
          tooltip: 'updata ',
          child: new Icon(Icons.mail),
        ));
  }
}
