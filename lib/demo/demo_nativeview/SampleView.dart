import 'dart:isolate';

import 'package:flutter/material.dart';

import 'Manager.dart';

class SampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("----->>>build");
    doSth(msg) => print("-----"+msg);

    Isolate.spawn(doSth, "Hi");
    Manager manager=new Manager();
    Manager manager2= Manager.instance;

    // Manager manager2 = Manager.instance;



    Isolate isolate;
//并发Isolate往管道发送一个字符串
    getMsg(sendPort) => sendPort.send("Hello");

    start() async {
      ReceivePort receivePort= ReceivePort();//创建管道
      //创建并发Isolate，并传入发送管道
      isolate = await Isolate.spawn(getMsg, receivePort.sendPort);
      //监听管道消息
      receivePort.listen((data) {
        print('Data：$data');
        receivePort.close();//关闭管道
        isolate?.kill(priority: Isolate.immediate);//杀死并发Isolate
        isolate = null;
      });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: InkWell(child: new Text('11111')),
      ),
      ////使用Android平台的AndroidView，传入唯一标识符sampleView
      /*  body: defaultTargetPlatform == TargetPlatform.android ?
        AndroidView(viewType: 'sampleView') : UiKitView(viewType: 'sampleView')*/
    );
  }
}
