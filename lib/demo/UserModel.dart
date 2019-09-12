//user_model.dart
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  String _user;

  String get user => _user;

  set user(value) => _user = value;

  bool verify(String username) {
    return username == 'Linker';
  }
}
