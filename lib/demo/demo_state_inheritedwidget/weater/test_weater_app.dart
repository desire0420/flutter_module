import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/demo/demo_state_inheritedwidget/weater/show_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'list_mode.dart';
import 'list_page.dart';

class WeaterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ListModel>(
      model: ListModel(),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('ScopedModel=='),
        ),
        body: Container(
            width: double.infinity,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ShowPage(),
                SizedBox(
                  height: 20,
                ),
                ListPage()
              ],
            )),
      ),
    );
  }
}
