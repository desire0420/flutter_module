import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommonWebView extends StatefulWidget {
  final String title;

  final String url;

  CommonWebView(this.title, this.url);

  @override
  State<StatefulWidget> createState() {
    return new _CommonWebViewPageState();
  }
}

class _CommonWebViewPageState extends State<CommonWebView> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: 'https://github.com/wang709693972wei/NativeFlutterApp',
      appBar: new AppBar(
        title: new Text('NativeFlutterApp'),
      ),
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
