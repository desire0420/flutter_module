//user_model.dart
import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String _user = "user";
  String memberName;
  String headImg = "1111";

  String get user => _user;

  void increment(value) {
    _user = value;
    notifyListeners();
  }
}
