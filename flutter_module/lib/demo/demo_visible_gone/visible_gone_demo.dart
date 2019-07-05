import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class VisibleAndGone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new VisibleAndGoneState();
  }
}

class VisibleAndGoneState extends State<VisibleAndGone> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: TitleBar('显示隐藏'),
        body: new Container(
          padding: EdgeInsets.all(16),
          child: new ListView(
            children: <Widget>[
              buildView(visible),
              new TestBWidget(visible: visible),
              new TestCWidget(visible: visible),
              new Text(
                  'A_view 分情况显示 返回一个长宽为0的widget 或者真是的View \n\nB_View opacity 其实是根据visible 控制透明度而已，其实还是占位的，相当于invisible，而且也是会渲染绘制的\n \nC_View  offstage为true时表示不渲染，也不占位，相当于gone'),
              new RaisedButton(
                  textColor: Colors.black,
                  child: new Text(visible ? '显示' : '隐藏(B_View会占位)'),
                  onPressed: () {
                    visible = !visible;
                    setState(() {});
                  }),
            ],
          ),
        ));
  }
}

// 方式一 返回一个长宽为0的widget占位
Widget buildView(bool visible) {
  return visible
      ? new Container(
          color: Colors.red,
          height: 100.0,
          child: new Center(
            child: new Text('A_View'),
          ))
      : new Container(height: 0.0, width: 0.0);
}

//解决方案2(透明度)： opacity 其实是根据visible 控制透明度而已，其实还是占位的，相当于invisible，而且也是会渲染绘制的
class TestBWidget extends StatelessWidget {
  final bool visible;

  TestBWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: new Container(
        color: Colors.blue,
        height: 100.0,
        child: new Center(
          child: new Text('B_View'),
        ),
      ),
    );
  }
}

// 方式3  offstage为true时表示不渲染，也不占位，相当于gone。
class TestCWidget extends StatelessWidget {
  final bool visible;

  const TestCWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Offstage(
      offstage: !visible,
      child: new Container(
        color: Colors.orange,
        height: 100.0,
        child: new Center(
          child: new Text('C_View'),
        ),
      ),
    );
  }
}
