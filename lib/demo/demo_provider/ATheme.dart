import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class ATheme with ChangeNotifier {
  Color bgColor = Color(0xFFF04A92);

  List colors = [Color(0xFFE22F9C), Color(0xFF7F57DB), Color(0xFFD0BBFF)];
  Random random = new Random();

  void setBgColor() {
    this.bgColor = colors[random.nextInt(3)] as Color;
    // 调用这个方法，通知所有监听
    notifyListeners();
  }
}
