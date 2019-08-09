import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'list_mode.dart';

class ShowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowPageState();
  }
}

class ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ListModel>(
        builder: (context, child, model) {
      return Text(model.selected);
    });
  }
}
