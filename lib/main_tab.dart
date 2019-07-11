import 'package:flutter/material.dart';
import 'package:flutter_module/project/gank_girl_display.dart';
import 'package:flutter_module/project/tab_android_page.dart';

import 'demo/demo_main/demo_main_display.dart';

class MainTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainTabDemo();
  }
}

class MainTabDemo extends State<MainTab> {
  int currentIndex = 0;

  final List<Widget> children = [
    WidgetDemoPage(),
    GankGirlDemo(),
    GitHubPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: children[currentIndex],

      //底部菜单
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          //底部导航栏大于3的时候需要设置
          fixedColor: Colors.green,
          //底部导航栏激活时候颜色
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.explore), title: new Text("Widget")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.history), title: new Text("Girl")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.ac_unit), title: new Text("mine"))
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
