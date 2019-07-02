import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/common/app_constance.dart';
import 'package:flutter_module/common/str_util.dart';
import 'package:http/http.dart' as http;

class HttpRequestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HttpRequestDemoState();
  }
}

class HttpRequestDemoState extends State<HttpRequestDemo> {
  var welcomeImageUrl = '';
  String data = '';

  void getHttpData() async {
    String url = AppConstance.makeUrl('services/app_ad_cover.json', null);
    var response = await http.get(url);
    print('--------------' + response.body);
    String responseData = response.body;
    List list = json.decode(response.body);
    String cover = '';
    var item;
    for (item in list) {
      cover = item['field_app_ad_cover'];
      if (cover != null && cover.isNotEmpty) {
        cover = StringUtil.getSrcImagePath(cover);
        break;
      }
    }
    print('cover===$cover');
    setState(() {
      welcomeImageUrl = cover;
      data = responseData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("点击请求数据"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          RaisedButton(
            onPressed: getHttpData,
            child: new Text("HTTP"),
          ),
          new Text(data),
          Image.network(
            welcomeImageUrl,
          )
        ],
      )),
    );
  }
}
