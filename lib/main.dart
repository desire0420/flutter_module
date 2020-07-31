import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_module/channel_page.dart';
import 'package:flutter_module/main_tab.dart';
import 'package:flutter_module/project/gank_girl_display.dart';
import 'package:provider/provider.dart';

import 'common/util/fps_calculate.dart';
import 'common/util/pv_exception.dart';
import 'demo/demo_lifecycle/life_recyle_test.dart';
import 'demo/demo_lifecycle/life_recyle_three.dart';
import 'demo/demo_lifecycle/life_recyle_two.dart';
import 'demo/demo_provider/CounterMode.dart';
import 'demo/demo_route/transmit_param_demo.dart';
import 'demo/demo_route/two_route_demo.dart';
import 'demo/demo_route/unknow_router.dart';
import 'demo/main_detail_demo.dart';

Future<Null> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    //将异常转发至Zone
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZoned<Future<Null>>(() async {
    runApp(ChangeNotifierProvider<CounterMode>.value(
      value: CounterMode(),
      child: MyApp(),
    ));
    //我们可以在 window 对象上注册 onReportTimings 方法， 计算帧率
    SchedulerBinding.instance.addTimingsCallback(onReportTimings);
  }, onError: (error, stackTrace) async {
    //拦截异常
    print('error--object----------------------\n${error.toString()}');
    print('error--stackTrace----------------------\n${stackTrace.toString()}');
    //统计PV
    await reportError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      //Debug标记
      title: 'Flutter Demo',
      navigatorObservers: [
        MyObserver(),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/screen1': (BuildContext context) => new LifeRecyleTest(),
        '/screen2': (BuildContext context) => new LifeRecyleTwo(),
        '/screen3': (BuildContext context) => new LifeRecyleThree(),
        '/main': (context) => MainTab(),
        '/detail': (context) => MainDetailDemo(
            desc: '详情', url: 'https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg'),
        '/twoRouter': (context) => TwoRouteDemo(),
        '/gridDisplay': (context) => GankGirlDemo(),
        '/transmit_param': (context) => TransmitParam(),
      },
      // 错误路由处理，统一返回 UnknownPage
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnKnowRouter()),
      home: widgetForRoute(window.defaultRouteName),
    );
  }
}

Widget widgetForRoute(String route) {
  print('----route--$route');
  switch (route) {
    case '/MyHomePage':
      return ChannelPage(title: 'Flutter  Home Page1');
    case '/screen1':
      return LifeRecyleTest();
    case '/fragment':
      return LifeRecyleTest();
    default:
      return MainTab();
  }
}
