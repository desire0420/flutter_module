class ResultData {
  Map<String, dynamic> response; // 所有返回值
  dynamic data; // 请求回来的data, 可能是list也可能是map
  int code; // 服务器的状态码
  String message; // 服务器给的提示信息
  /// true 请求成功 false 请求失败
  bool result = true; // 客户端是否请求成功false: HTTP错误
  String url = "";

  ResultData(this.message, this.result, {this.url = ""});

  ResultData.response(this.response, {this.url = ""}) {
    this.code = this.response["code"];
    this.message = this.response["message"];
    this.data = this.response["data"];
  }

  bool isFail() {
    bool success = result && code == 200;
    return !success;
  }

  bool isSuccess() {
    bool success = result && code == 200;
    return success;
  }
}
