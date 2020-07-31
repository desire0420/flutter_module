import 'dart:async';

import 'package:flutter/material.dart';

int exceptionCount = 0;

Future<Null> reportError(dynamic error, dynamic stackTrace) async {
  exceptionCount++; //累加异常次数
//  print("异常次数 : $exceptionCount");
  // FlutterCrashPlugin.getInstance().postException(error, stackTrace);
}

int totalPV = 0;

//页面异常率 = 异常发生次数 / 整体页面 PV 数。
class MyObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    totalPV++; //累加PV
   // print("totalPV : $totalPV");
   // print("异常率 : ${pageException()}");
  }
}

double pageException() {
  if (totalPV == 0) return 0;

  return exceptionCount / totalPV;
}
