import 'package:flutter/foundation.dart';

class CounterMode with ChangeNotifier {//混入ChangeNotifier
  int _count = 0;
  get count => _count;

  void increment() {
    _count++;
    notifyListeners();//通知
  }
}
