import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class TwoRouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _onPressed() {
      print('_result-pop');
      Navigator.of(context).pop('这是来自RoutePageWithValue1的返回值');
    }

    return new Scaffold(
      appBar: TitleBar('路由第二页面'),
      body: new ListView(
        children: <Widget>[
          new RaisedButton(
            onPressed: _onPressed,
            textColor: Colors.black,
            child: new Text("点击返回上一个页面将参数传过去"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/main', (Route<dynamic> route) => false);
            },
            textColor: Colors.black,
            child: new Text("销毁其他所有的页面，点击直接去新的MainTable'"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/main'));
            },
            textColor: Colors.black,
            child: new Text("销毁除了栈顶的所有页面"),
          ),
          //即比如当前从页面1进入页面2，在页面2使用
          // Navigator.of(context).pushReplacementNamed('/screen3');进入页面3，
          // 当进入了页面3后，页面2将执行dispose方法，此时在页面3返回时，会回到页面1.
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/detail');
            },
            textColor: Colors.black,
            child: new Text("跳转并销毁当前页面（1）"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/main');
            },
            textColor: Colors.black,
            child: new Text("跳转并销毁当前页面（2）"),
          ),
        ],
      ),
    );
  }
}
