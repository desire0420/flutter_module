import 'package:flutter/material.dart';

Widget getProgressDialog() {
  return new Center(child: new CircularProgressIndicator());
}

//预加载布局
Widget loading() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(
        strokeWidth: 1.0,
      ),
      Container(
        child: Text("正在加载..."),
        margin: EdgeInsets.only(top: 10.0),
      )
    ],
  );
}

