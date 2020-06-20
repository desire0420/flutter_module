import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_button/button_demo.dart';
import 'package:flutter_module/demo/demo_tablayout/local_image_page.dart';
import 'package:flutter_module/demo/demo_tablayout/three_page.dart';
import 'package:flutter_module/demo/demo_tablayout/image_page.dart';
import 'package:flutter_module/demo/demo_text/text_demo.dart';
import 'package:flutter_module/demo/demo_widget/widget_example.dart';

const List<String> tabs = ["Widget",'网络加载', '本地加载', "TextField输入", "Text","Button"];

class TabLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TabLayoutPage(),
    );
  }
}

class TabLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabLayoutPageState();
  }
}

/**混合 mixins (with)
    在Flutter 中：
    混合的对象是类
    可以混合多个*/
class TabLayoutPageState extends State<TabLayoutPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      appBar: new AppBar(
          title: Text('常用Widget'),
          centerTitle: true,
          bottom: new TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            isScrollable: true,
            //允许滚动
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            tabs: tabs.map((String title) {
              return new Tab(
                text: title,
              );
            }).toList(),
          ),
      ),
      body: new TabBarView(controller: _tabController, children: [
        WidgetExamplePage(),
        LocalImagePage(),
        ImagePage(),
        TextFieldDemo(),
        TextDemoTest(),
        ButtonStudyDemo(),
      ]),
    );
  }
}
