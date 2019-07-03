import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';

import 'package:flutter_module/mvp/fl_presenter.dart';
import 'package:flutter_module/mvp/fl_presenter_impl.dart';
import 'package:flutter_module/mvp/mode/fl_model.dart';

class GankGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Grid'),
        centerTitle: true,
      ),
      body: new Container(padding: EdgeInsets.all(15), child: new GankGrid()),
    );
  }
}

class GankGrid extends StatefulWidget {
  GankGrid({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    GankGridState view = new GankGridState();
    FLPresenter presenter = new FLPresenterImpl(view);
    presenter.init();
    return view;
  }
}

class GankGridState extends State<GankGrid> implements FLView {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  List<FLModel> datas = [];

  FLPresenter flPresenter;

  int curPageNum = 1;

  bool isRefresh = true;
  ScrollController scrollController =
      new ScrollController(); // ListView 添加 ScrollController做滑动监听

  @override
  void initState() {
    super.initState();
    refreshData();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    //判断当前滑动位置是不是到达底部，触发加载更多回调
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('----------loadData----');
      loadData();
    }
  }

  Future<Null> refreshData() {
    isRefresh = true;
    final Completer<Null> completer = new Completer<Null>();
    curPageNum = 1;
    flPresenter.loadFLData(curPageNum, 10);
    setState(() {});
    completer.complete(null);
    return completer.future;
  }

  Future<Null> loadData() {
    isRefresh = false;
    final Completer<Null> completer = new Completer<Null>();
    curPageNum = curPageNum + 1;
    flPresenter.loadFLData(curPageNum, 10);
    setState(() {});
    completer.complete(null);
    return completer.future;
  }

  Widget buildItemCard(BuildContext context, int index) {
    final String item = datas[index].url;
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MainDetailDemo(desc: datas[index].desc,url:item)));
      },
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.network(
            item,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          new Padding(
            padding: EdgeInsets.all(10),
            child: new Text(
              datas[index].desc,
              textDirection: TextDirection.ltr,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = new ListView.builder(
      //设置physics属性总是可滚动
      physics: AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      itemCount: datas.length,
      itemBuilder: buildItemCard,
    );

    var refreshIndicator = new RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: refreshData,
      child: content,
    );
    return refreshIndicator;
  }

  @override
  void onloadFLFail() {
    // TODO: implement onloadFLFail
  }

  @override
  void onloadFLSucces(List<FLModel> list) {
    if (!mounted) return; //异步处理，防止报错
    setState(() {
      if (isRefresh) {
        datas = list;
      } else {
        datas.addAll(list);
      }
    });
  }

  @override
  setPresenter(FLPresenter presenter) {
    // TODO: implement setPresenter
    flPresenter = presenter;
  }
}
