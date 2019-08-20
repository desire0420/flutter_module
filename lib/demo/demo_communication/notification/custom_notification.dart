import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  CustomNotification(this.msg);

  final String msg;
}

// 抽离出一个子 Widget 用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      // 按钮点击时分发通知
      onPressed: () => CustomNotification("Hi").dispatch(context),
      child: Text("Fire Notification"),
    );
  }
}

class ParentWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<ParentWidgetPage> {
  String _msg = " 通知：";

  @override
  Widget build(BuildContext context) {
    // 监听通知
    return NotificationListener<CustomNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        }); // 收到子 Widget 通知，更新 msg
      },
      child: Scaffold(
        body: new Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_msg), CustomChild()], // 将子 Widget 加入到视图树中
        )),
      ),
    );
  }
}
