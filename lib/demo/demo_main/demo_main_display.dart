import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_box_decoration/box_decoration_demo.dart';
import 'package:flutter_module/demo/demo_button/button_demo.dart';
import 'package:flutter_module/demo/demo_card/card_demo.dart';
import 'package:flutter_module/demo/demo_checkbox/check_box_demo.dart';
import 'package:flutter_module/demo/demo_clip/clip_demo.dart';
import 'package:flutter_module/demo/demo_datatable/data_table_demo.dart';
import 'package:flutter_module/demo/demo_datatable/paginated_data_table_demo.dart';
import 'package:flutter_module/demo/demo_dialog/dialog_study_demo.dart';
import 'package:flutter_module/demo/demo_gesture/dismiss_gesture_demo.dart';
import 'package:flutter_module/demo/demo_gesture/gesture_demo.dart';
import 'package:flutter_module/demo/demo_globalkey/globalkey_form_page.dart';
import 'package:flutter_module/demo/demo_gridview/grid_demo.dart';
import 'package:flutter_module/demo/demo_http/http_request_dio.dart';
import 'package:flutter_module/demo/demo_input/login_register_from_demo.dart';
import 'package:flutter_module/demo/demo_lifecycle/life_recyle_test.dart';
import 'package:flutter_module/demo/demo_listview_drawer/drawer_demo.dart';
import 'package:flutter_module/demo/demo_listview_drawer/image_list.dart';
import 'package:flutter_module/demo/demo_route/route_demo.dart';
import 'package:flutter_module/demo/demo_route/two_route_demo.dart';
import 'package:flutter_module/demo/demo_sliver/sliver_demo.dart';
import 'package:flutter_module/demo/demo_step/step_demo.dart';
import 'package:flutter_module/demo/demo_text/text_demo.dart';
import 'package:flutter_module/demo/demo_viewpager/page_view_demo.dart';
import 'package:flutter_module/demo/demo_visible_gone/visible_gone_demo.dart';

class WidgetDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WidgetDemoPageState();
  }
}

class WidgetDemoPageState extends State<WidgetDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('常用Widget'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "ListView--drawer滑菜单-",
            page: ImageList(),
          ),
          ListItem(title: 'Http', page: HttpRequestDemo()),
          ListItem(title: 'BoxDecorationDemo', page: BoxDecorationDemo()),
          ListItem(title: 'Button', page: ButtonStudyDemo()),
          ListItem(title: 'CardView', page: CardStudyDemo()),
          ListItem(title: 'CheckboxDemo', page: CheckboxDemo()),
          ListItem(title: 'ClipStudy', page: ClipStudyDemo()),
          ListItem(
              title: 'PaginatedDataTableDemo', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'DialogStudyDemo', page: DialogStudyDemo()),
          ListItem(title: 'DismissedPage', page: DismissedPage()),
          ListItem(title: 'GesturePageDemo', page: GesturePageDemo()),
          ListItem(title: 'SwitcherWidget', page: SwitcherWidget()),
          ListItem(title: 'GridDemo', page: GridDemo()),
          ListItem(title: 'InputDemo', page: InputDemo()),
          ListItem(title: 'LiferecyleTest', page: LiferecyleTest()),
          ListItem(title: 'RouteDemo', page: RouteDemo()),
          ListItem(title: 'TwoRouteDemo', page: TwoRouteDemo()),
          ListItem(title: 'SliverDemo', page: SliverDemo()),
          ListItem(title: 'StepStudyDemo', page: StepStudyDemo()),
          ListItem(title: 'TextDemoTest', page: TextDemoTest()),
          ListItem(title: 'PageViewDemo', page: PageViewDemo()),
          ListItem(title: 'VisibleAndGone', page: VisibleAndGone()),
        ],
      ),
      //侧滑菜单

      drawer: new Drawer(
        child: new DrawerDemo(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(bottom: 1),
      child: new Column(
        children: <Widget>[
          new ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            //设置内容边距，默认是 16，但我们在这里设置为 0
            trailing: Icon(Icons.keyboard_arrow_right),
            title: new Text(title),
            onTap: () {
              Navigator.push(
                  context, new CupertinoPageRoute(builder: (context) => page));
            },
          ),
          new Divider(
            height: 2,
          )
        ],
      ),
    );
  }
}

Widget buildItem(BuildContext context, String desc, String routeName) {
  return new Padding(
    padding: EdgeInsets.all(3),
    child: new RaisedButton(
        textColor: Colors.black,
        child: new Text(desc),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        }),
  );
}
