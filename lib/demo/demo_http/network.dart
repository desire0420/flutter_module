import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_module/demo/demo_http/zhihu_mode_entity.dart';

var baseUrl = 'https://api.apiopen.top/musicRankingsDetails?';

var result = '1-';
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
Future getHttp() async {
  try {
    Response response = await Dio().get(baseUrl, queryParameters: query);
    if (response.statusCode == HttpStatus.OK) {
      result = response.data.toString();
      // decodeTest(response.data);
    }
  } catch (exception) {
    result = '网络异常';
  }
  return result;
}

get(url, {data, options}) async {
  print('get请求启动! url：$url ,body: $data');
  Response response;
  try {
    response = await Dio().get(
      url,
      queryParameters: data,
    );
    print('------get请求成功!response.data：${response.data}');
  } on DioError catch (e) {
    if (CancelToken.isCancel(e)) {
      print('get请求取消! ' + e.message);
    }
    print('get请求发生错误：$e');
  }
  return response.data;
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
  //setState(() {});
}
