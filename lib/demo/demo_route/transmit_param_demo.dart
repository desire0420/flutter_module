import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class TransmitParam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 取出路由参数
    String msg = ModalRoute.of(context).settings.arguments as String;

    return new Scaffold(
      appBar: TitleBar('接受参数'),
      body: new Center(
        child: Text('接收到参数----${msg}'),
      ),
    );
  }
}
