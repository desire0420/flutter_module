import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/common/progreess_dialog.dart';
import 'package:flutter_module/demo/demo_http/async_demo.dart';
import 'package:flutter_module/demo/demo_http/net/app_api.dart';
import 'package:flutter_module/demo/demo_http/net/result_data.dart';
import 'package:flutter_module/demo/demo_http/net/weather_bean.dart';
import 'package:flutter_module/demo/demo_http/zhihu_mode_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpRequestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HttpRequestDemoState();
  }
}

class HttpRequestDemoState extends State<HttpRequestDemo> {
  var result = '1-';
  var baseUrl = 'https://api.apiopen.top/musicRankingsDetails?';
  var query = {"type": 1, "page": 1, "PageSize": 15};
  List<ZhihuModeResult> list = [];

//解析数据
  decodeTest(var body) {
    int code = body['code'];
    String message = body['message'];
    List result = body['result'];
    list = result.map((model) {
      return new ZhihuModeResult.fromJson(model);
    }).toList();
    //  print('---list----${list.length}');
  }

  //使用第三方库Dio的请求
  void _loadDataByDio() async {
    try {
      Response response = await Dio().get(baseUrl, queryParameters: query);
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

  String weather = "";

  void _getWeather() async {
    ResultData resultData =
        await AppApi.getInstance().getWeather(context, true);
    if (resultData.isSuccess()) {
      WeatherBean weatherBean = WeatherBean.fromJson(resultData.response);
      setState(() {
        weather = json.encode(weatherBean.result[1]);
        print('-----weather----${weather}');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDataByDio();
    _getWeather();
  }

  Widget itemView(BuildContext context, int index) {
    // print('------index-----${index}');
    final String item = list[index].artistName;
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context, new CupertinoPageRoute(builder: (context) => AsyncDemo()));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            Text(list[index].artistName,
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(height: 10.0),
            Text(list[index].siProxycompany,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget contentView() {
    if (list.isEmpty) {
      return getProgressDialog();
    } else {
      return new ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemBuilder: itemView,
        itemCount: list.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("请求数据"),
        centerTitle: true,
      ),
      body: contentView(),
    );
  }
}
