import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_main/demo_main_display.dart';
import 'package:flutter_module/demo/demo_text/text_demo.dart';


//创建tab栏目 类似Viewpager  +tablayout 效果
class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text(
              'Tablayout+ViewPager',
              style: TextStyle(fontSize: 15),
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              //允许滚动
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicatorColor: Colors.yellow,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              tabs: <Widget>[
                Tab(
                  text: "WidgetStudy",
                ),

                Tab(
                  text: "Text",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              WidgetDemoPage(),
              TextDemoTest(),
            ],
          ),
        ));
  }
}

void onPress(msg) {
  debugPrint(msg);
}
