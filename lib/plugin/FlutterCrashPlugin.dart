import 'package:flutter/services.dart';

class FlutterCrashPlugin {
  MethodChannel _methodChannel;

  static FlutterCrashPlugin _instance;

  FlutterCrashPlugin._internal() {
    if (_methodChannel == null) {
      _methodChannel = new MethodChannel("post_exception");
    }
  }

  static FlutterCrashPlugin getInstance() {
    if (_instance == null) {
      _instance = new FlutterCrashPlugin._internal();
    }
    return _instance;
  }

  Future<Null> postException(error, stackTrace) async {
    Map<String, String> map = {
      'crash_message': error.toString(),
      'crash_detail': stackTrace.toString()
    };
    await _methodChannel.invokeMethod("postException", map);
  }
}
