import 'package:flutter/services.dart';

class MethodChannelManager {
  MethodChannel _methodChannel;

  static MethodChannelManager _instance;


  MethodChannelManager._internal() {
    if (_methodChannel == null) {
      _methodChannel = new MethodChannel("base_flutter");
    }
  }

  static MethodChannelManager getInstance() {
    if (_instance == null) {
      _instance = new MethodChannelManager._internal();
    }
    return _instance;
  }

  Future<String> sendMessage() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};
    String message = await _methodChannel.invokeMethod("success", map);
    return message;
  }
}
