import 'package:flutter/material.dart';

Widget TitleBar(String title) {
  return new AppBar(
    //leading: new Icon(Icons.arrow_back_ios),
    title: new Text(title),
    centerTitle: true,
    elevation: 0.0,
  );
}
