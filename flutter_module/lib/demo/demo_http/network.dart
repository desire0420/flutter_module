import 'package:flutter_module/demo/demo_http/zhihu_mode_entity.dart';

var baseUrl = 'https://api.apiopen.top/musicRankingsDetails?';

/*
//使用第三方库Dio的请求
Future Get(query) async {
  var result;
  try {
    Dio dio = new Dio();
    Response response = await dio.get(baseUrl, queryParameters: query);
    if (response.statusCode == HttpStatus.OK) {
      result = response.data.toString();
      //  decodeTest(response.data);
    } else {
      result = 'error code : ${response.statusCode}';
    }
  } catch (exception) {
    result = '网络异常';
  }
}
*/

decodeTest111(var body) {
  int code = body['code'];
  String message = body['message'];
  List result = body['result'];
  print('---message----${code}:${result}');

  List<ZhihuModeResult> list = result.map((model) {
    return new ZhihuModeResult.fromJson(model);
  }).toList();

  print('---list----${list.length}');

  list.forEach(
      (model) => print('---1----${model.country}:${model.artistName}'));
}
