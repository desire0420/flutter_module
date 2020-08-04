import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/demo/demo_channel/SampleView.dart';
import 'package:flutter_module/plugin/MethodChannelManager.dart';

import 'NativeViewController.dart';

class ChannelPage extends StatefulWidget {
  ChannelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<ChannelPage> {
  NativeViewController controller;
  int counter = 0;

  var nativeParams;

  var basicMessageChannel;
  var testMethodChannelManager;

  static const _channel = BasicMessageChannel('BasicMessageChannelTest', StringCodec());

//MethodChannel 使用场景：Flutter端向Native端发送通知
//EventChannel使用场景：Native端向Flutter端发送通知

  StreamSubscription fromAndroiSub;

  void initBasicMessageChannel() {
    _channel.setMessageHandler((String message) async {
      setState(() {
        basicMessageChannel = message;
      });
      return 'basicMessageChannel 回传给Native的信息';
    });
  }

  @override
  void initState() {
    super.initState();
    controller = NativeViewController();
    print('---创建执行的第一个方法-----init state');
    startEventChannel(); //监听原生数据的变化
    initBasicMessageChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("原生的一些交互")),
        body: new Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: new ListView(
                children: <Widget>[
                  new RaisedButton(
                      textColor: Colors.black,
                      child: new Text('--MethodChannel- 调用原生方法通道'),
                      onPressed: () {
                        MethodChannelManager.getInstance().sendMessage().then((data) {
                          setState(() {
                            testMethodChannelManager = "原生的方法调用成功并且回传给你一个$data";
                          });
                          //FLToast.show("native回传的数据$data", context);
                        });
                      }),
                  new RaisedButton(
                      textColor: Colors.black,
                      child: new Text('BasicMessageChannel从flutter 端发送数据给原生'),
                      onPressed: () async {
                        final String reply =
                            await _channel.send('BasicMessageChannel从flutter 端发送数据给原生');
                        setState(() {
                          basicMessageChannel = reply;
                        });
                      }),
                  new Text('EventChannel获取原生的数据流：$nativeParams'),
                  SizedBox(height: 20),
                  new Text(basicMessageChannel ?? "--"),
                  SizedBox(height: 20),
                  new Text(testMethodChannelManager ?? "--"),
                  new Text("flutter容器嵌套Native View1"),
                  Container(width: 200, height: 200, child: SampleView(controller: controller)),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.cached), onPressed: () => controller.changeBackgroundColor()));
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
