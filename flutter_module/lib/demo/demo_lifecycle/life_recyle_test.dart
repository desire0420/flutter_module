import 'package:flutter/material.dart';
//生命周期测试   修改main.dart  home: NewsDetailPage(),
class LiferecyleTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailState();
}

class NewsDetailState extends State<LiferecyleTest> {
  int text = 1;

  NewsDetailState() {
    print('-------构造函数');
}


  @override
  void initState() {
    print('--widget创建执行的第一个方法-----init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('-----当State对象的依赖发生变化时会被调用--didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('-------widget build');

    return Scaffold(
      body: Center(
        child: _loading(),
      ),
      appBar: AppBar(
        title: Text('生命周期'),
      ),
    );
  }
  @override
  void didUpdateWidget(LiferecyleTest oldWidget) {
    print('-------组件状态改变时候调用：didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    print('-------reassemble---此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。');
    super.reassemble();
  }



  @override
  void deactivate() {
    print('-------State对象从树中被移除时：deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('-------久移除时调用；通常在此回调中释放资源：dispose');
    super.dispose();
  }

  //预加载布局
  Widget _loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
        Container(
          child: Text("233正在加载--"),
          margin: EdgeInsets.only(top: 10.0),
        )
      ],
    );
  }
}

