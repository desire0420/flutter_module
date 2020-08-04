import 'package:flutter/material.dart';

import 'NativeViewController.dart';

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
