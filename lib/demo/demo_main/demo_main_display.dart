import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_http/http_request_dio.dart';
import 'package:flutter_module/demo/demo_listview_drawer/drawer_demo.dart';
import 'package:flutter_module/demo/demo_listview_drawer/image_list.dart';

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
