import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  //获取到插件与原生的交互通道   MethodChannel 使用场景：Flutter端向Native端发送通知
  static const toAndroidPlugin =
      const MethodChannel("com.demo.app.toandroid/plugin");

  // EventChannel 使用场景：Native端向Flutter端发送通知
  static const fromAndroiPlugin =
      const EventChannel('com.demo.app.toflutter/plugin');

  StreamSubscription fromAndroiSub;
  var nativeParams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
          child: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面--'),
                onPressed: () {
                  _jumpToNative();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面(带参数)--'),
                onPressed: () {
                  _jumpToNativeWithValue();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('这是一个从原生获取的参数：$nativeParams'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Flutter App'),
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
//                  Navigator.of(context)
//                      .push(MaterialPageRoute(builder: (context) => TabMain()));
                }),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    print('---创建执行的第一个方法-----init state');
    startfromAndroiPlugin(); //开启监听
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消监听
    if (fromAndroiSub != null) {
      fromAndroiSub.cancel();
    }
  }

  //加载来自原生的参数， Flutter接收原生发送的参数
  void startfromAndroiPlugin() {
    if (fromAndroiSub == null) {
      fromAndroiSub = fromAndroiPlugin
          .receiveBroadcastStream()
          .listen(onfromAndroidEvent, onError: onfromAndroidError);
    }
  }

  //加载来自原生的参数成功
  void onfromAndroidEvent(Object event) {
    print('---------onfromAndroiEvent----- ${event}');
    setState(() {
      nativeParams = event;
    });
  }

  //加载来自原生的参数失败
  void onfromAndroidError(Object error) {
    print('-----------onfromAndroiError-----init state${error}');
    setState(() {
      nativeParams = "error";
    });
  }

  Future<Null> _jumpToNative() async {
    String result = await toAndroidPlugin.invokeMethod('oneAct');
    print('------re-${result}');
  }

  //跳转原生传参
  Future<Null> _jumpToNativeWithValue() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};
    String result = await toAndroidPlugin.invokeMethod('twoAct', map);
    print(result);
  }
}
