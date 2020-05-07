import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/common/progreess_dialog.dart';
import 'package:flutter_module/demo/demo_http/upload_image_bean.dart';

/**参考https://segmentfault.com/a/1190000015620822
 * https://blog.csdn.net/yuzhiqiang_1993/article/details/89155870
 * */
class AsyncDemo extends StatelessWidget {
  // 模拟异步任务  等待3秒  返回用户信息
  Future<UploadImageBean> _getUserInfo() async {
    await new Future.delayed(new Duration(milliseconds: 3000));
    UploadImageBean bean = new UploadImageBean();
    bean.imgUrl = "123";
    bean.width = 1232;
    bean.height = 1239;
    print('-----awt---');
    return bean;
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
              getTTT();
              // _loadUserInfo();
            },
            child: Text('异步任务'),
          ),
          new Text('Future对象表示异步操作的结果，我们通常通过then（）来处理返回的结果'
              '\nasync用于标明函数是一个异步函数，其返回值类型是Future类型'
              '\nawait用来等待耗时操作的返回结果，这个操作会阻塞到后面的代码'
              '\nFutureBuilder 实际上就是对Future进行封装的一个Widget。'),
          new FutureBuilder(
            //future接收Future<T>类型的值，实际上就是我们的异步函数，通常情况下都是网络请求函数
            future: _getUserInfo(),
            builder: (BuildContext context, AsyncSnapshot<UploadImageBean> snapshot) {
              /*表示数据成功返回*/
              if (snapshot.hasData) {
                String response = snapshot.data.imgUrl;
                return Text("${response}");
              } else {
                return getProgressDialog();
              }
            },
          )
        ],
      ),
    );
  }
}

/**
 * 请求接口获取数据
 * 注意一下几点：
    网络请求是耗时操作
    要使用async来标明getData这个函数是一个异步函数
    await 用于等待请求返回的结果，此时会阻塞掉后面的代码，只有当请求结束后面的代码才会执行
    async标注的函数其返回值类型是Future
 */
Future<Response> getData() async {
  await Future.delayed(Duration(seconds: 3), () {
    print("延时三秒后请求数据");
  });

  String url = "http://v.juhe.cn/toutiao/index";
  String key = "4c52313fc9247e5b4176aed5ddd56ad7";
  String type = "keji";
  print("---开始请求数据");
  Response response = await Dio().get(url, queryParameters: {"type": type, "key": key});
  print("---请求完成}");
  return response;
}

getTTT() {
  //Future对象表示异步操作的结果，我们通常通过then（）来处理返回的结果
  getData().then((result) {
    print("---接口返回的数据是:${result}");
  }).whenComplete(() {
    print("---异步任务处理完成");
  }).catchError(() {
    print("---出现异常了");
  });
  print("---我是在请求数据后面的代码呦！");
}
