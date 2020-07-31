//login_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:provider/provider.dart';

import 'UserInfoPage.dart';
import 'UserModel.dart';

class LoginPage extends StatelessWidget {
  final UserModel providerModel = new UserModel();
  var num = 1;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: providerModel,
      child: Scaffold(
        appBar: TitleBar('状态管理'),
        body: Consumer<UserModel>(
          builder: (context, UserModel model, child) {
            return Column(
              children: <Widget>[
                FlatButton(
                  child: Text('Login'),
                  color: Colors.blue,
                  highlightColor: Colors.blue[300],
                  onPressed: () {
                    num++;
                    providerModel.increment();
                  },
                ),
                SizedBox(height: 20),
                UserInfoPage()
              ],
            );
          },
        ),
      ),
    );
  }
}
