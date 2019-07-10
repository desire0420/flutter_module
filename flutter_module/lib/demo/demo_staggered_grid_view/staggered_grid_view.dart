import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';


class StaggeredGridViewDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StaggeredGridViewState();
  }
}

class StaggeredGridViewState extends State<StaggeredGridViewDemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(appBar: TitleBar('StaggeredGridView'),);
  }

}