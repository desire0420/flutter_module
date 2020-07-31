import 'package:flutter/material.dart';
import 'package:flutter_module/Fwidget/button/raised_button_widger.dart';
import 'package:flutter_module/common/util/navigator_util.dart';
import 'package:provider/provider.dart';

import 'ATheme.dart';
import 'CounterMode.dart';
import 'LoginPage.dart';
import 'UserInfoPage.dart';

class ProviderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('first screen rebuild');
    // 注意在 build 里面调用 Provider.of<ATheme>(context); 就会自动注册监听；也不用担心重复注册；
    ATheme appTheme = Provider.of<ATheme>(context);
    CounterMode loginInfo = Provider.of<CounterMode>(context);

    return Scaffold(
      // 这里可以直接使用 model 的属性了，如果有变化会自动刷新
      backgroundColor: appTheme.bgColor,
      appBar: AppBar(
        title: Text("全局状态管理"),
        actions: <Widget>[
          FlatButton(
            child: Text("局部刷新"),
            onPressed: () {
              NavigatorUtil.pushReplacement(context, SecondPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${loginInfo.count}"),
            SizedBox(height: 30),
            new FLRaisedButton(
                btnTxt: '单页面状态管理',
                onPressed: () {
                  NavigatorUtil.push(context, LoginPage());
                }),
            UserInfoPageTwo(),
          ],
        ), //用Provider.of<Counter>(context).count获取_count的值，Provider.of<T>(context)相当于Provider去查找它管理的Counter()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ATheme>(context).setBgColor();
          Provider.of<CounterMode>(context)
              .increment(); //用Provider.of<Counter>(context).increment();调用Counter()中的increment()方法
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('second screen rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
        child: Consumer<CounterMode>(
          builder: (context, CounterMode model, child) {
            print('Consumer111');
            return Text(
              '----: ${model.count}---',
            );
          },
        ),
      ),
      //极大地缩小你的控件刷新范围
      floatingActionButton: Consumer<CounterMode>(
        builder: (context, CounterMode model, child) {
          print('Consumer2222');

          return FloatingActionButton(
            onPressed: () {
              model.increment();
            },
            child: Icon(Icons.add),
          );
        },
      ),

      //刷新整个build
      /*     floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<CounterMode>(context).increment(); //2
          },
          child: Icon(Icons.add),
        );*/
    );
  }
}
