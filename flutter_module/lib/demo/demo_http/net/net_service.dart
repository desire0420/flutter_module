library msnetservice;

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/demo/demo_http/net/result_data.dart';
import 'package:flutter_module/demo/demo_http/net/session_manager.dart';

enum Method {
  GET,
  POST,
}

class NetService {
  static const String _TAG = "----TAG-11--";

  /// get请求
  get(String url, {Map<String, dynamic> params, BuildContext context}) async {
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

  ///  请求部分
  request(
    String url, {
    Method method,
    Map<String, dynamic> params,
    var file,
    String fileName,
    String fileSavePath,
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

  getHeaders() {
    return null;
  }

  getBasicUrl() {
    return null;
  }
}
