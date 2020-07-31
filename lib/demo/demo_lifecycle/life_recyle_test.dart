import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/demo/demo_lifecycle/life_recyle_two.dart';

extension ExtendsFun on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

//生命周期测试
class LifeRecyleTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailState();
}

class NewsDetailState extends State<LifeRecyleTest> with WidgetsBindingObserver {
  var text = 'setState';

  NewsDetailState() {
    int i = '42'.parseInt();
    print(i);
    print('life---one----构造函数');
  }

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("life--one-- didChangeAppLifecycleState: $state");
  }

  @override
  Widget build(BuildContext context) {
    print('life---one----build---');
    return Scaffold(
        appBar: TitleBar('生命周期'),
        body: new Column(children: <Widget>[
          new Text('----LogCat输入life过滤---查看日志打印的状态'),
          new RaisedButton(
              child: Text(text),
              onPressed: () {
                Navigator.push(
                        context, new CupertinoPageRoute(builder: (context) => LifeRecyleTwo()))
                    .then((value) {
                  print('tag<<<<<<>>>>>>>one' + value);
                });
              }),
          new Image.asset('images/lifecycle.png')
        ]));
  }

  @override
  void initState() {
    print('life--one--widget创建执行的第一个方法-----init state');
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  @override
  void didChangeDependencies() {
    print('life--one---当State对象的依赖发生变化时会被调用--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifeRecyleTest oldWidget) {
    print('life-----one----组件状态改变时候调-用：didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    print(
        'life----one---reassemble---此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。');
    super.reassemble();
  }

  @override
  void deactivate() {
    print('life---one----State对象从树中被移除时：deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('life---one----久移除时调用；通常在此回调中释放资源：dispose');
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //销毁观察者
  }
}
