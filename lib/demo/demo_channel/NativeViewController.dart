import 'package:flutter/services.dart';

class NativeViewController {
  MethodChannel _channel;

  onCreate(int id) {
    _channel = MethodChannel('samples.wangwei/native_views_$id');
  }

  changeBackgroundColor() async {
    _channel.invokeMethod('changeBackgroundColor');
  }
}
