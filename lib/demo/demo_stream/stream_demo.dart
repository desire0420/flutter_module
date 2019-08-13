import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamTestDemo(),
    );
  }
}

class StreamTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StreamTestDemoState();
  }
}

class StreamTestDemoState extends State<StreamTestDemo> {
  StreamSubscription streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  var _data = "--";

  @override
  void initState() {
    super.initState();
    //使用StreamController 管理Stream
    _streamDemo = StreamController<String>();
    //为了向Stream中插入数据，StreamController提供了类型为StreamSink的属性sink作为入口；
    _sinkDemo = _streamDemo.sink;
    //StreamSubscription 可以管理事件的订阅  取消 暫停  添加
    streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamDemo.close();
  }

  void onData(String data) {
    print('---------${data}');
    setState(() {
      _data = data;
    });
  }

  void onError(error) {
    print('--------error:$error');
  }

  void onDone() {
    print('--------Done');
  }

  Future<String> fetchData() async {
    await Future.delayed(new Duration(seconds: 3));
    // throw 'soming err';
    return 'hello word';
  }

  void _addDataToStream() async {
    print('------Add data to stream.');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _pauseStream() {
    print('------Pause subscription');
    streamSubscription.pause();
  }

  void _resumeStream() {
    print('------Resume subscription');
    streamSubscription.resume();
  }

  void _cancelStream() {
    print('------Cancel subscription');
    streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_data),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*---------------------------------------*/

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('-----Create a stream.');
    //支持多次订阅
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;
    print('-----Start listening on a stream.');
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('-----Initialize completed.');
  }

  void onDone() {
    print('-----Done!');
  }

  void onError(error) {
    print('-----Error: $error');
  }

  void onData(String data) {
    print('onData：-----$data');
  }

  void onDataTwo(String data) {
    print('-----onDataTwo: $data');
  }

  void _pauseStream() {
    print('-----Pause subscription');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('-----Resume subscription');
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('-----Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  void _addDataToStream() async {
    print('-----Add data to stream.');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something happened';
    return '-----hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
