import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/common/constant.dart';
import 'package:flutter_module/demo/demo_http/net/result_data.dart';
import 'package:flutter_module/demo/demo_http/net/session_manager.dart';

Widget getProgress() {
  return new Center(child: new CircularProgressIndicator());
}

class BasicNetService {
  static const String _TAG = "----TAG---";

  // get请求
  getRequest(
      String url, Map<String, dynamic> params, BuildContext context) async {
    return await request(
      url,
      Method.GET,
      params,
      context,
    );
  }

  // post请求
  postRequest(
      String url, Map<String, dynamic> params, BuildContext context) async {
    return await request(
      url,
      Method.POST,
      params,
      context,
    );
  }

  //真正的請求
  request(String url, Method method, Map<String, dynamic> params,
      BuildContext context) async {
    try {
      Response response;
      //传参进行统一处理, 加上基本公共参数
      Map<String, dynamic> basicParam = await getBasicParam();
      basicParam["timeStamp"] =
          (new DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
      if (basicParam != null) {
        params.addAll(basicParam);
      }

      //请求header
      SessionManager sessionManager = SessionManager();
      var headers = await getHeaders();
      if (headers != null) {
        sessionManager.options.headers = headers;
      }

      //请求域名
      var baseUrl = Constant.base_url;
      sessionManager.options.baseUrl = baseUrl;

      // 打印网络日志
      StringBuffer requestParam = new StringBuffer();
      requestParam.write('\n${baseUrl + url}');
      requestParam.write('\nparams:---${json.encode(params)}');
      requestParam.write('\nheaders:---${json.encode(headers)}');
      print('-------params------->${requestParam.toString()}');

      switch (method) {
        case Method.GET:
          response = await sessionManager.get(url, queryParameters: params);
          break;
        case Method.POST:
          response = await sessionManager.post(url, data: params);
          break;
      }
      return await handleDataSource(response, method, url: url);
    } catch (exception) {
      return ResultData("网络连接异常", false, url: url);
    }
  }

  // 数据处理
  static handleDataSource(Response response, Method method, {String url = ""}) {
    ResultData resultData;
    String errorMsg = "";
    int statusCode;
    statusCode = response.statusCode;
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
      } catch (exception) {
        resultData = ResultData(exception.toString(), true, url: url);
      }
    }
    // 当apiToken 过期或者错误时的提示码
    if (102 == resultData.code /*&& context != null*/) {
      // 退出登录并跳转到未登陸界面
    }
    return resultData;
  }
}

getHeaders() async {
  Map<String, dynamic> headers;
  //headers["token"] = "absqghsnldmw1349818742864njddbw";
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
