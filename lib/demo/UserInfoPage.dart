
//userinfo_page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'UserModel.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ScopedModelDescendant<UserModel>(
          builder: (BuildContext context, Widget child, UserModel model) {
            return Text('Username: ${model.user}', style: Theme.of(context).textTheme.display1,);
          },
        ),
      ),
    );
  }
}
