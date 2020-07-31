//user_model.dart
import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  int _count = 10;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
