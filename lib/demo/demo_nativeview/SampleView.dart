import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        ////使用Android平台的AndroidView，传入唯一标识符sampleView
      /*  body: defaultTargetPlatform == TargetPlatform.android ?
        AndroidView(viewType: 'sampleView') : UiKitView(viewType: 'sampleView')*/
    );
  }
}