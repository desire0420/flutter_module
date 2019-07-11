import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_module/home_page.dart';
import 'package:flutter_module/main_tab.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/main': (context) => MainTab(),
      },
      home: widgetForRoute(window.defaultRouteName),
    );
  }
}

Widget widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MyHomePage(title: 'Flutter  Home Page1');
    case 'route2':
      return MyHomePage(title: 'Flutter  Home Page2---');
    default:
      return MyHomePage(title: 'Flutter  Home Page2--defeat');
  }
}
