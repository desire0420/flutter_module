import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/common/ui_help.dart';

class CustomNotification extends Notification {
  CustomNotification(this.msg);

  final String msg;
}

// 抽离出一个子 Widget 用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: UIHelp.color_E22F9C,
      padding: EdgeInsets.all(20),
      child: new Column(
        children: <Widget>[
          Text("我是子Widget"),
          RaisedButton(
            // 按钮点击时分发通知
            onPressed: () =>
                CustomNotification("我接受到子Widget发送过来的消息了").dispatch(context),
            child: Text("点击我通知父Widget更新"),
          )
        ],
      ),
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
  String _msg = " 我是父Widget：";

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
        appBar: TitleBar('子Widget通知父Widget'),
        body: new Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(20),
              color: UIHelp.color_7F57DB,
              child: Text(_msg),
            ),
            SizedBox(
              height: 20,
            ),
            CustomChild()
          ], // 将子 Widget 加入到视图树中
        )),
      ),
    );
  }
}
