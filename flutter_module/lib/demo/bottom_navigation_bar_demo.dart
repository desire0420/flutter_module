import 'package:flutter/material.dart';

//底部导航,有状态的小部件   StatefulWidget
class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavigationBarDemoState();
  }
}


class BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int currentIndex = 0;

  void TapHandler(index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: TapHandler,
        type: BottomNavigationBarType.fixed,
        //底部导航栏大于3的时候需要设置
        fixedColor: Colors.black,
        //底部导航栏激活时候颜色
        items: [
          BottomNavigationBarItem(icon: new Icon(
              Icons.explore), title: new Text("main")),
          BottomNavigationBarItem(icon: new Icon(
              Icons.history), title: new Text("history")),
          BottomNavigationBarItem(icon: new Icon(
              Icons.mail), title: new Text("mail")),
          BottomNavigationBarItem(icon: new Icon(
              Icons.ac_unit), title: new Text("mine"))
        ])
    ;
  }

}