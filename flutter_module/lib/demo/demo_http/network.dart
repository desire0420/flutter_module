import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_module/demo/demo_http/hot_news_model.dart';

var baseUrl = 'https://api.apiopen.top/musicRankingsDetails?';

//使用第三方库Dio的请求
Future Get(query) async {
  var result;
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
}

decodeTest(var body) {
  int result = body['code'];
  String message = body['message'];
  List resultData = body['result'];
  print('---message----${message}:${result}');
  List<HotNewsStoriesModel> list = resultData.map((model) {
    return new HotNewsStoriesModel.fromJson(model);
  }).toList();
  print('---list----${list.length}');

  list.forEach(
      (model) => print('---1----${model.country}:${model.artist_name}'));
}
