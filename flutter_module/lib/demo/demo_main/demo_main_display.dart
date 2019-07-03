import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_button/button_demo.dart';
import 'package:flutter_module/demo/demo_card/card_demo.dart';
import 'package:flutter_module/demo/demo_checkbox/check_box_demo.dart';
import 'package:flutter_module/demo/demo_clip/clip_demo.dart';
import 'package:flutter_module/demo/demo_datatable/data_table_demo.dart';
import 'package:flutter_module/demo/demo_datatable/paginated_data_table_demo.dart';
import 'package:flutter_module/demo/demo_dialog/dialog_study_demo.dart';
import 'package:flutter_module/demo/demo_globalkey/globalkey_form_page.dart';
import 'package:flutter_module/demo/demo_gridview/grid_demo.dart';
import 'package:flutter_module/demo/demo_http/http_request_demo.dart';
import 'package:flutter_module/demo/demo_input/login_register_from_demo.dart';
import 'package:flutter_module/demo/demo_lifecycle/life_recyle_test.dart';
import 'package:flutter_module/demo/demo_listview_drawer/drawer_demo.dart';
import 'package:flutter_module/demo/demo_listview_drawer/image_list.dart';
import 'package:flutter_module/demo/demo_sliver/sliver_demo.dart';
import 'package:flutter_module/demo/demo_step/step_demo.dart';
import 'package:flutter_module/demo/demo_text/text_demo.dart';
import 'package:flutter_module/demo/demo_viewpager/page_view_demo.dart';

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
        title: Text('Widget基本知识点'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "GlobalKey---能够跨Widget访问状态",
            page: GlobalKeyFromPage(),
          ),
          ListItem(
            title: "Sliver--- 折叠布局 的实现",
            page: SliverDemo(),
          ),
          ListItem(
            title: "Step---",
            page: StepStudyDemo(),
          ),
          ListItem(
            title: "ListView--drawer滑菜单-",
            page: ImageList(),
          ),
          ListItem(
            title: "GridView-",
            page: GridDemo(),
          ),
          ListItem(title: 'Clip', page: ClipStudyDemo()),
          ListItem(title: 'Card---CardView', page: CardStudyDemo()),
          ListItem(title: 'Checkbox—折叠View等', page: CheckboxDemo()),
          ListItem(title: 'Dialog', page: DialogStudyDemo()),
          ListItem(
            title: "DataTable",
            page: DataTableDemo(),
          ),
          ListItem(
            title: "PaginatedDataTableDemo",
            page: PaginatedDataTableDemo(),
          ),
          ListItem(title: '生命周期', page: LiferecyleTest()),
          ListItem(title: 'Button', page: ButtonStudyDemo()),
          ListItem(title: 'Http', page: HttpRequestDemo()),
          ListItem(title: 'ViewPage', page: PageViewDemo()),
          ListItem(title: 'Text', page: TextDemoTest()),
          ListItem(title: 'EditText', page: InputDemo()),

        ],
      ),
        //侧滑菜单
        drawer: new DrawerDemo());

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
