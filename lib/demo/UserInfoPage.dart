//userinfo_page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserModel.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("${Provider.of<UserModel>(context).user}");
    return Container(
      color: Colors.white,
      child: Center(
        child: Consumer<UserModel>(
          builder: (context, UserModel model, child) {
            return Text(
              'Username: ${model.user}',
            );
          },
        ),
      ),
    );
  }
}
