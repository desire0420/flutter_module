import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute(this.widget)
      : super(
            // 设置过度时间
            transitionDuration: Duration(milliseconds: 400),
            // 构造器
            pageBuilder: (
              // 上下文和动画
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child,
            ) {
              //  左右滑动动画效果
              return SlideTransition(
                position: Tween<Offset>(
                        // 设置滑动的 X , Y 轴
                        begin: Offset(1.0, 0.0),
                        end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
