import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

//生命周期测试
class LiferecyleTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailState();
}

class NewsDetailState extends State<LiferecyleTest> {
  int text = 1;

  NewsDetailState() {
    print('life-------构造函数');
  }

  @override
  Widget build(BuildContext context) {
    print('life-------build---');

    return Scaffold(
        appBar: TitleBar('生命周期'),
        body: new Column(children: <Widget>[
          new Text('----LogCat输入life过滤---查看日志打印的状态'),
          new Image.asset('images/lifecycle.png')
        ]));
  }

  @override
  void initState() {
    print('life----widget创建执行的第一个方法-----init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('life-----当State对象的依赖发生变化时会被调用--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LiferecyleTest oldWidget) {
    print('life-------组件状态改变时候调-用：didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    print(
        'life-------reassemble---此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。');
    super.reassemble();
  }

  @override
  void deactivate() {
    print('life-------State对象从树中被移除时：deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('life-------久移除时调用；通常在此回调中释放资源：dispose');
    super.dispose();
  }
}
