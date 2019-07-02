import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/http_request_demo.dart';
import 'package:flutter_module/demo/button_demo.dart';
import 'package:flutter_module/demo/card_demo.dart';
import 'package:flutter_module/demo/check_box_demo.dart';
import 'package:flutter_module/demo/clip_demo.dart';
import 'package:flutter_module/demo/data_table_demo.dart';
import 'package:flutter_module/demo/dialog_study_demo.dart';
import 'package:flutter_module/demo/life_recyle_test.dart';
import 'package:flutter_module/demo/list_demo.dart';
import 'package:flutter_module/demo/paginated_data_table_demo.dart';
import 'package:flutter_module/demo/step_demo.dart';

class StudyWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "PaginatedDataTableDemo",
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: "DataTable",
            page: DataTableDemo(),
          ),
          ListItem(title: '生命周期', page: LiferecyleTest()),
          ListItem(title: 'Clip', page: ClipStudyDemo()),
          ListItem(title: 'Card---CardView', page: CardStudyDemo()),
          ListItem(title: 'Step', page: StepStudyDemo()),
          ListItem(title: 'Http', page: HttpRequestDemo()),
          ListItem(title: 'Button', page: ButtonStudyDemo()),
          ListItem(title: 'Checkbox—折叠View等', page: CheckboxDemo()),
          ListItem(title: 'Dialog', page: DialogStudyDemo()),
          ListItem(title: 'BuildList', page: ListDemoStudy()),
        ],
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
      child: new Column(children: <Widget>[
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
        new Divider(height: 2,)
      ],),
    );
  }
}
