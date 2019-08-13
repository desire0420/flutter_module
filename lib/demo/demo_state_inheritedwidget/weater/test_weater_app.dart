import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/demo/demo_state_inheritedwidget/weater/show_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'list_mode.dart';
import 'list_page.dart';

class WeaterApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeaterAppState();
  }
}

class WeaterAppState extends State<WeaterApp> {
  @override
  Widget build(BuildContext context) {
    ListModel countModel = ListModel();
    countModel.loadList();
    print('------- model.loadList(--');
    // TODO: implement build
    return ScopedModel<ListModel>(
      model: countModel,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('ScopedModel=='),
        ),
        body: Container(
            width: double.infinity,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(onPressed: () {
                  print('-----123456780');
                  ListModel model = ScopedModel.of<ListModel>(context);
                  model.select('******');
                }),
                ShowPage(),
                SizedBox(
                  height: 20,
                ),
                ListPage()
              ],
            )),
      ),
    );
    ;
  }
}
