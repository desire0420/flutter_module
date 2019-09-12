//login_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'UserInfoPage.dart';
import 'UserModel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ScopedModelDescendant<UserModel>(
            builder: (BuildContext context, Widget child, UserModel model) {
              return FlatButton(
                child: Text('Login'),
                color: Colors.blue,
                highlightColor: Colors.blue[300],
                onPressed: () {
                  model.user = 'jhahahhah';
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return UserInfoPage();
                  }));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
