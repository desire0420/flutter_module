import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/Fwidget/fl_toast.dart';
import 'package:flutter_module/plugin/MethodChannelManager.dart';

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
//EventChannel使用场景：Native端向Flutter端发送通知

  StreamSubscription fromAndroiSub;
  static const _channel = BasicMessageChannel('flutter_and_native_100', StringCodec());

  void initBasicMessageChannel() {
    // Receive messages from platform
    _channel.setMessageHandler((String message) async {
      print('---->flutter接受到Android主动发送的信息 $message');
      return 'A';
    });
  }

  void exampleBasicMessageChannel() async {
    final String reply = await _channel.send('Hello World form Dart');
    print('---->flutter接受到Android回复的信息$reply');
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
                  MethodChannelManager.getInstance().sendMessage().then((data) {
                    FLToast.show("native回传的数据$data", context);
                  });
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
      fromAndroiSub =
          EventChannel('flutter_event_channel').receiveBroadcastStream().listen((dynamic event) {
        // print('---------EventChannel----- ${event}');
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
