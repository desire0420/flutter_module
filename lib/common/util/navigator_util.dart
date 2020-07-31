import 'package:flutter/material.dart';

import 'custom_page_anim.dart';

//CupertinoPageRoute
//MaterialPageRoute
class NavigatorUtil {
  //valueSetter   跳转下一个界面  携带参数返回
  static void push(BuildContext context, Widget widget, {ValueSetter<dynamic> valueSetter}) {
    Navigator.push(context, CustomPageRoute(widget)).then((param) {
      if (null != valueSetter) {
        valueSetter(param);
      }
    });
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, CustomPageRoute(widget));
  }

  static void pushNamed(BuildContext context, String routeName, {Object arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
