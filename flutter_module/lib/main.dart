import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_globalkey/globalkey_form_page.dart';
import 'package:flutter_module/demo/demo_route/two_route_demo.dart';
import 'package:flutter_module/demo/demo_sliver/sliver_demo.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';
import 'package:flutter_module/home_page.dart';
import 'package:flutter_module/main_tab.dart';
import 'package:flutter_module/project/gank_girl_display.dart';

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
        '/GlobalKeyFromPage': (context) => GlobalKeyFromPage(),
        '/SliverDemo': (context) => SliverDemo(),
        '/detail': (context) => MainDetailDemo(
            desc: '福利',
            url:
                'https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg'),
        '/gridDisplay': (context) => GankGirlDemo(),
        '/twoRouter': (context) => TwoRouteDemo(),
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
