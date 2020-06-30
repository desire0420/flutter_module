import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DefaultState();
}

class DefaultState extends State<DefaultPage> {
  NativeViewController controller;

  @override
  void initState() {
    controller = NativeViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SampleView")),
        body: Center(
          child: Container(width: 200, height: 200, child: SampleView(controller: controller)),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.cached),
            onPressed: () => controller.changeBackgroundColor()));
  }
}

class SampleView extends StatefulWidget {
  const SampleView({
    Key key,
    this.controller,
  }) : super(key: key);

  final NativeViewController controller;

  @override
  State<StatefulWidget> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'SampleView',
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }

  _onPlatformViewCreated(int id) => widget.controller?.onCreate(id);
}

class NativeViewController {
  MethodChannel _channel;

  onCreate(int id) {
    _channel = MethodChannel('samples.wangwei/native_views_$id');
  }

  changeBackgroundColor() async {
    _channel.invokeMethod('changeBackgroundColor');
  }
}
