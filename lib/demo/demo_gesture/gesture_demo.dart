import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/demo/demo_button/border_button.dart';

class GesturePageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GesturePage(),
    );
  }
}

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StepStudyState();
  }
}

class StepStudyState extends State<GesturePage> {
  showSnakeBar(String str) {
    final snackBar = new SnackBar(content: new Text(str));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: TitleBar('Gesture-手势'),
        body: ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10),
              child: new RaisedButton(
                onPressed: () {
                  print('-------------');
                  showSnakeBar('-这是一个 RaisedButton 点击事件,onPressed处理');
                },
                textColor: Colors.black,
                child: Text('这是一个 RaisedButton 点击事件,onPressed处理'),
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(10),
              child: new GestureDetector(
                onTap: () {
                  showSnakeBar("这是一个GestureDetector监听的onTap事件");
                },
                child: new BorderButton('GestureDetector onTap 按钮'),
              ),
            ),
            new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new Text('-上面的按钮通过GestureDetector监听事件后，涟漪效果消失了，使用下面的方案解决'),
            ),
            new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new InkWell(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  onTap: () {
                    showSnakeBar("这是一个InkWell监听的onTap事件");
                  },
                  child: new BorderButton('InkWell 按钮'),
                )),
            new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new InkWell(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  onTap: () {
                    Navigator.pushNamed(context, '/DismissedPage');
                  },
                  child: new BorderButton('Dismissed 手势'),
                )),
          ],
        ));
  }
}
