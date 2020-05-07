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

  var nativeParams;

  //MethodChannel 使用场景：Flutter端向Native端发送通知
  static const toAndroidPlugin = const MethodChannel('com.demo.app.toandroid/plugin');

//EventChannel使用场景：Native端向Flutter端发送通知
  static const fromAndroiPlugin = const EventChannel('com.demo.app.toflutter/plugin');
  StreamSubscription fromAndroiSub;

  static const _channel = BasicMessageChannel('flutter_and_native_100', StringCodec());

  //跳转原生
  void exampleMethodChannel() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};
    String result = await toAndroidPlugin.invokeMethod('flutterToNative', map);
    print('--------result--------->>${result}');
  }

  void initBasicMessageChannel() {
    // Receive messages from platform
    _channel.setMessageHandler((String message) async {
      print('---->Received message = $message');
      return '---->我收到了延迟3秒发送过来的信息';
    });
  }

  void exampleBasicMessageChannel() async {
    final String reply = await _channel.send('Hello World form Dart');
    print('---->$reply');
  }

  @override
  void initState() {
    super.initState();
    print('---创建执行的第一个方法-----init state');
    startEventChannel(); //监听原生数据的变化
    initBasicMessageChannel();
  }

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
                child: new Text('--MethodChannel- 用于传递方法调用-'),
                onPressed: () {
                  exampleMethodChannel();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('--BasicMessageChannel 主要是传递字符串json等数据和一些半结构体的数据，需要指定编码方式--'),
                onPressed: () {
                  exampleBasicMessageChannel();
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
                }),
          ),
        ],
      )),
    );
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
  void startEventChannel() {
    if (fromAndroiSub == null) {
      fromAndroiSub = fromAndroiPlugin.receiveBroadcastStream().listen((dynamic event) {
        print('---------onfromAndroiEvent----- ${event}');
        setState(() {
          nativeParams = event;
        });
      }, onError: (Object error) {
        setState(() {
          nativeParams = "error";
        });
      }, cancelOnError: true);
    }
  }
}
