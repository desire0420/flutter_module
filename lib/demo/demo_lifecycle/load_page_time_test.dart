import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

//生命周期测试
// ignore: must_be_immutable
class LoadPageTimeTest extends StatefulWidget {
  int startTime;
  int endTime;

  LoadPageTimeTest({Key key}) : super(key: key) {
    //页面初始化时记录启动时间
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  State<StatefulWidget> createState() => NewsDetailState();
}

class NewsDetailState extends State<LoadPageTimeTest> {
  var text = 'setState';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar('页面加载时长'),
        body: new Column(children: <Widget>[
          new Text('页面加载时长'),
        ]));
  }

  @override
  void initState() {
    super.initState();
    //通过帧绘制回调获取渲染完成时间
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.endTime = DateTime.now().millisecondsSinceEpoch;
      int timeSpend = widget.endTime - widget.startTime;
      print("Page render time:${timeSpend} ms");
    });
  }

  @override
  void didChangeDependencies() {
    print('life--one---当State对象的依赖发生变化时会被调用--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LoadPageTimeTest oldWidget) {
    print('life-----one----组件状态改变时候调-用：didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('life---one----久移除时调用；通常在此回调中释放资源：dispose');
    super.dispose();
  }
}
