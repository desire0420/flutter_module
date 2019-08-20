import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class UnKnowRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 取出路由参数
    String msg = ModalRoute.of(context).settings.arguments as String;

    return new Scaffold(
      appBar: TitleBar('路由未找到'),
      body: new Center(
        child: Text('路由未找到'),
      ),
    );
  }
}
