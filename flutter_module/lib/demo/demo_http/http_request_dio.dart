import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/demo/demo_http/async_demo.dart';
import 'package:flutter_module/demo/demo_http/network.dart';

class HttpRequestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HttpRequestDemoState();
  }
}

class HttpRequestDemoState extends State<HttpRequestDemo> {
  var result = '1-';
  var decodeResult = '----';
  var baseUrl = 'https://api.apiopen.top/musicRankingsDetails?';

  var query = {"type": 1, "page": 2, "PageSize": 15};

  //使用第三方库Dio的请求
  loadDataByDio() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get(baseUrl, data: query);
      if (response.statusCode == HttpStatus.OK) {
        result = response.data.toString();
        decodeTest(response.data);
      } else {
        result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      result = '网络异常';
    }

    setState(() {});
  }

  getHttp() {
    print('---data----');
    Get(query).then((data) {
      print('---data----${data}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("请求数据"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          RaisedButton(
            onPressed: getHttp,
            child: new Text("Dio请求"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new CupertinoPageRoute(builder: (context) => AsyncDemo()));
            },
            child: new Text("异步"),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('原始数据：\n$result'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('解析后的数据：\n$decodeResult'),
          ),
        ],
      )),
    );
  }
}
