import 'package:flutter/material.dart';
import 'package:flutter_module/demo/basic_widgets.dart';
import 'package:flutter_module/demo/grid_demo.dart';
import 'package:flutter_module/demo/page_view_demo.dart';
import 'package:flutter_module/demo/widget_study_demo.dart';
import 'package:flutter_module/demo/text_demo.dart';

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
                  //icon: Icon(Icons.directions_bike),
                  text: "网格布局",
                ),
                Tab(
                  text: "WidgetStudy",
                ),
                Tab(
                  text: "常用布局",
                ),
                Tab(
                  text: "PageView",
                ),
                Tab(
                  text: "Text",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              GridDemo(),
              StudyWidgetDemo(),
              BasicWidget(),
              PageViewDemo(),
              TextDemoTest(),
            ],
          ),
        ));
  }
}

void onPress(msg) {
  debugPrint(msg);
}
