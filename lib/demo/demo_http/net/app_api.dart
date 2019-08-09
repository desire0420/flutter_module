library basicnetservice;

import 'package:flutter/widgets.dart';
import 'package:flutter_module/demo/demo_http/net/basic_net_service.dart';
import 'package:flutter_module/demo/demo_http/net/result_data.dart';

/**音乐排行榜详情接口：
    https://api.apiopen.top/musicRankingsDetails?type=1
 */
class AppApi extends BasicNetService {
  static const String _GET_WEATHER = "musicRankingsDetails";

  static AppApi _instance;

  static AppApi getInstance() {
    if (_instance == null) {
      _instance = AppApi();
    }
    return _instance;
  }

  Future<ResultData> getMusic(BuildContext context,) async {
    Map<String, dynamic> param = {};
    param["type"] = "1";
    ResultData resultData = await getRequest(_GET_WEATHER, param, context);
    return resultData;
  }
}
