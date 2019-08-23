import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: TitleBar('Widget'),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              child: Text('Container（容器）在 UI 框架中是一个很常见的概念，Flutter 也不例外。'),
              padding: EdgeInsets.all(18.0),
              // 内边距
              margin: EdgeInsets.all(44.0),
              // 外边距
              width: 180.0,
              height: 140,
              alignment: Alignment.center,
              // 子 Widget 居中对齐
              decoration: BoxDecoration(
                //Container 样式
                color: Colors.red, // 背景色
                borderRadius: BorderRadius.circular(10.0), // 圆角边框
              ),
            ),

            //Row 的用法示范
            new Padding(
              padding: EdgeInsets.all(20),
              child: Text('Row横向布局'),
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 180,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.green,
                  width: 60,
                  height: 80,
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: Text('我希望 Row 组件（或 Column 组件）中的绿色容器与黄色容器均分剩下的空间'
                  '于是就可以设置它们的弹性系数参数 flex 都为 1，这两个 Expanded 会按照其 flex 的比例'
                  '（即 1：1）来分割剩余的 Row 横向（Column 纵向）空间：Row横向布局平均分配剩余空间'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow, height: 60)),
                // 设置了 flex=1，因此宽度由 Expanded 来分配
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 180,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.green, height: 60),
                )
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: Text('Column纵向布局'),
            ),
            Column(
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 180,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.green,
                  width: 60,
                  height: 80,
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: Text('层叠布局'),
            ),
            Stack(
              children: <Widget>[
                Container(color: Colors.yellow, width: 300, height: 300),
                // 黄色容器
                Positioned(
                  left: 18.0,
                  top: 18.0,
                  child: Container(
                      color: Colors.green,
                      width: 50,
                      height: 50), // 叠加在黄色容器之上的绿色控件
                ),
                Positioned(
                  left: 18.0,
                  top: 70.0,
                  child: Text("Stack 提供了层叠布局的容器 "), // 叠加在黄色容器之上的文本
                )
              ],
            ),

            //Row 的用法示范
            Row(
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 180,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.green,
                  width: 60,
                  height: 80,
                ),
              ],
            ),

//--------
            Column(
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 180,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 80,
                ),
                Container(
                  color: Colors.green,
                  width: 60,
                  height: 80,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
