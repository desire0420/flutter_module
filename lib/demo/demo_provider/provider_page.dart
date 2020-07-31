import 'package:flutter/material.dart';
import 'package:flutter_module/Fwidget/button/raised_button_widger.dart';
import 'package:flutter_module/common/util/navigator_util.dart';
import 'package:provider/provider.dart';

import 'CounterMode.dart';
import 'LoginPage.dart';

class ProviderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () {
              NavigatorUtil.push(context, SecondPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${Provider.of<CounterMode>(context).count}"),
            SizedBox(height: 30),
            new FLRaisedButton(
                btnTxt: '单页面状态管理',
                onPressed: () {
                  NavigatorUtil.push(context, LoginPage());
                }),
          ],
        ), //用Provider.of<Counter>(context).count获取_count的值，Provider.of<T>(context)相当于Provider去查找它管理的Counter()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
    var counter = Provider.of<CounterMode>(context).count;
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
        child: Text("${counter}"),
        //child: Text("${Provider.of<Counter>(context).count}"),//1
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterMode>(context).increment(); //2
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
