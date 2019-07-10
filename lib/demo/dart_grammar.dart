import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class DartDemo extends StatelessWidget {
  void meathed() {
    List<String> list = [];
    list.forEach((model) => print('---1----'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: TitleBar('Dart'),
      body: new Container(),
    );
  }
}
