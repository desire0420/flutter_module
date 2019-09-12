import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class SingleThreadDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    testFuture() {
      // 声明一个匿名 Future异步任务
      Future(() => print('------f1'));
      // 声明了一个匿名 Future，并注册了两个 then。第一个 then 是一个 Future
      Future(() => print('------f2'))
          .then((_) => Future(() => print('------f3')))
          .then((_) => print('------f4'));
      // 声明一个匿名 Future，并注册了一个 then，此时Future 函数体与 then 共用一个事件循环
      Future(() => print('------f5')).then((_) => print('------f6'));
      //Future 函数体是 null，这意味着它不需要也没有事件循环，因此后续的then 也无法与它共享。
      // 在这种场景下，Dart 会把后续的then 放入微任务队列，在下一次事件循环中执行。会加入微任务队列，尽快执行
      Future(() => null).then((_) => print('------f7'));
      // 启动一个微任务
      scheduleMicrotask(() => print('------f8'));
      //常规打印
      print('------f9');
    }

    // 声明了一个延迟 3 秒返回的 Hello Flutter   的 Future，
    Future<String> fetchContent() async {
      await Future.delayed(new Duration(seconds: 3));
      return 'Hello Flutter';
    }

    testAwaitAndAsync() async {
      String data = await fetchContent();
      print('-----${data}-----');
    }




// 异步函数会同步等待 Hello 2019 的返回，并打印
    func() async => print('-----${await fetchContent()}');

    testAwaitAndAsyncTwoSample() {
      print("-----func before");
      func();
      print("-----func after");
    }


    return Scaffold(
        appBar: TitleBar('SingleThreadDemo'),
        body: new Column(children: <Widget>[
          new RaisedButton(
            child: Text("testFuture"),
            onPressed: () => testFuture(),
          ),
          new RaisedButton(
            child: Text("testAwaitAndAsync"),
            onPressed: () => testAwaitAndAsync(),
          ),
          new RaisedButton(
            child: Text("testAwaitAndAsyncTwoSample"),
            onPressed: () => testAwaitAndAsyncTwoSample(),
          )
        ]));
  }
}
