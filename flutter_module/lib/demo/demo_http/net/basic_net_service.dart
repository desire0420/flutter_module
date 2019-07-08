library basicnetservice;

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/common/constant.dart';
import 'package:flutter_module/demo/demo_http/net/net_service.dart';
import 'package:flutter_module/demo/demo_http/net/result_data.dart';
import 'package:flutter_module/demo/demo_http/net/session_manager.dart';

class BasicNetService extends NetService {
  static const String _TAG = "----TAG-11--";

  // get请求
  getRequest(String url,
      {Map<String, dynamic> params, BuildContext context}) async {
    return await request(
      url,
      method: Method.GET,
      params: params,
      context: context,
    );
  }

  /// post请求
  post(String url,
      {Map<String, dynamic> params,
      BuildContext context,
      bool showLoad}) async {
    return await request(
      url,
      method: Method.POST,
      params: params,
      context: context,
    );
  }

  request(String url,
      {Method method,
      Map<String, dynamic> params,
      BuildContext context}) async {
    /// 传参进行统一处理, 加上基本参数
    Map<String, dynamic> basicParam = await getBasicParam();
    basicParam["timeStamp"] =
        (new DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    if (params != null) {
      basicParam.addAll(params);
    }

    ResultData resultData =
        await requestReadly(url, method: method, params: basicParam);

    /// 当apiToken 过期或者错误时的提示码
    if ("0" == resultData.code && context != null) {
      // 退出登录并跳转到登录界面
      //App.navigateTo(context, QuRoutes.ROUTE_MINE_LOGIN, clearStack: true);
    }
    return resultData;
  }

  // 请求部分
  requestReadly(
    String url, {
    Method method,
    Map<String, dynamic> params,
    BuildContext context,
  }) async {
    try {
      Response response;
      SessionManager sessionManager = SessionManager();
      var headers = await getHeaders();
      if (headers != null) {
        sessionManager.options.headers = headers;
      }
      var baseUrl = await getBasicUrl();
      sessionManager.options.baseUrl = baseUrl;

      // 打印网络日志
      StringBuffer requestParam = new StringBuffer();
      requestParam.write("$_TAG ");
      requestParam.write("Url:");
      requestParam.write(baseUrl);
      requestParam.write(url);
      requestParam.write("\n");
      requestParam.write("$_TAG ");
      requestParam.write("params:");
      requestParam.write(json.encode(params));
      // print(requestParam.toString());

      switch (method) {
        case Method.GET:
          print("---net_service-- url:" + url);
          response = await sessionManager.get(url, queryParameters: params);
          break;
        case Method.POST:
          response = await sessionManager.post(url, data: params);
          break;
      }
      return await handleDataSource(response, method, url: url);
    } catch (exception) {
      //printLog("$_TAG net exception= " + exception.toString());
      return ResultData("网络连接异常", false, url: url);
    }
  }

  /// 数据处理
  static handleDataSource(Response response, Method method, {String url = ""}) {
    ResultData resultData;
    String errorMsg = "";
    int statusCode;
    statusCode = response.statusCode;
    print("---net_service-- statusCode:" + statusCode.toString());
    Map<String, dynamic> data;
    if (response.data is Map) {
      data = response.data;
    } else {
      data = json.decode(response.data);
    }

    //处理错误部分
    if (statusCode != 200) {
      errorMsg = "网络请求错误,状态码:" + statusCode.toString();
      resultData = ResultData(errorMsg, false, url: url);
    } else {
      try {
        resultData = ResultData.response(data);
        print('------net_service---${resultData.result}');
      } catch (exception) {
        resultData = ResultData(exception.toString(), true, url: url);
      }
    }
    return resultData;
  }
}

getBasicUrl() {
  return Constant.base_url;
}

getHeaders() async {
  Map<String, dynamic> headers;
  return headers;
}

Future<Map<String, dynamic>> getBasicParam() async {
  Map<String, dynamic> basicParam = {};
  basicParam["agent"] = Platform.isAndroid ? "android" : "ios";
  return basicParam;
}

enum Method {
  GET,
  POST,
}
