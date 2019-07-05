import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

/**参考https://segmentfault.com/a/1190000015620822*/
class AsyncDemo extends StatelessWidget {
  // 模拟异步任务  等待3秒  返回用户信息
  Future _getUserInfo() async {
    await new Future.delayed(new Duration(milliseconds: 3000));
    return "我是用户";
  }

  /// 加载用户信息，顺便打印时间看看顺序
  _loadUserInfo() {
    print("----1loadUserInfo:${new DateTime.now()}");
    _getUserInfo().then((info) {
      //會先执行下面的方法   3秒等待完后再执行这个
      print('-----2---' + info);
    });
    print("-----3--loadUserInfo:${new DateTime.now()}");
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: TitleBar('异步'),
      body: new ListView(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              _loadUserInfo();
            },
            child: Text('异步任务'),
          )
        ],
      ),
    );
  }
}
