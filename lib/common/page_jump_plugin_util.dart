import 'package:flutter/services.dart';

//页面跳转插件管理
class PageJumpPluginUtil {
  static const MethodChannel _channel_name = const MethodChannel("plugins.flutter/ulove_page_jump");

  /*销毁当前页面*/
  static Future<void> flutterContentFinish() async {
    try {
      print('--------fun1--------->>');
      await _channel_name.invokeMethod('open');
      print('--------fun2--------->>');
    } catch (exception) {}
  }
}
