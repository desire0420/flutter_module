//userinfo_page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserModel.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print("${Provider.of<UserModel>(context).user}");
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Consumer<UserModel>(
              builder: (context, UserModel model, child) {
                return Text(
                  '----: ${model.count}---',
                );
              },
            ),
            UserInfoPageTwo(),
          ],
        ),
      ),
    );
  }
}

class UserInfoPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text("----------------"),
      ),
    );
  }
}
