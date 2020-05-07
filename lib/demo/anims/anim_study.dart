import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
// 使用CustomAnimatedWidget
class TestAnim extends StatefulWidget {
  _TestAnimState createState() => new _TestAnimState();
}

class _TestAnimState extends State<TestAnim> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> slideTransition;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);

    //Offset  这里解释一下，是相对于自己移动的比例倍数
    slideTransition = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 1),
    ).animate(controller);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 100),
        Center(
          child: SlideTransition(
            position: slideTransition,
            child: new Container(
              height: 400,
              child: InkWell(
                onTap: () {
                  controller.forward();
                },
                child: CustomApp(),
              ),
            ),
          ),
        ),
        new RaisedButton(
          onPressed: () {
            // trcontroller.forward();
          },
          child: new Text("开始"),
        )
      ],
    ));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
*/

// 使用CustomAnimatedWidget
class WaterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WaterViewState();
  }
}

class _WaterViewState extends State<WaterView> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    animation = new Tween(begin: 1.5, end: 1.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new ScaleTransition(
      //设置动画的缩放中心
      alignment: Alignment.center,
      //动画控制器
      scale: animation,
      //将要执行动画的子view
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset(
            "images/qipao1.png",
            height: 75,
            width: 75,
          ),
          Text('2g', style: TextStyle(color: Color(0xFF3E69A3), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
