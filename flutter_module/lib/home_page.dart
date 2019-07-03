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

  //获取到插件与原生的交互通道
  static const toAndroidPlugin =
      const MethodChannel('com.demo.app.toandroid/plugin');

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
            child: new Text('下面是Flutter组件'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面'),
                onPressed: () {
                  jumpToNative();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面(带参数)'),
                onPressed: () {
                  jumpToNativeWithParams();
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
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Flutter MVP模式  展示妹子'),
                onPressed: () {
                  Navigator.pushNamed(context, '/gridDisplay');
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

  //跳转原生
  Future<Null> jumpToNative() async {
    String result = await toAndroidPlugin.invokeMethod('noParams');
    print(result);
  }

  //跳转原生传参
  Future<Null> jumpToNativeWithParams() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数----"};
    String result = await toAndroidPlugin.invokeMethod('withParams', map);
    print(result);
  }
}
