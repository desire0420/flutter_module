import 'package:flutter/material.dart';
import 'package:flutter_module/common/ui_help.dart';
import 'package:scoped_model/scoped_model.dart';

import 'count_mode.dart';



/**将Model放入顶层  下面的小部件都可以访问Mode*/
class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: CountModel(),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('ScopedModel'),
        ),
        body: Column(
          children: <Widget>[ChildOne(), ChildTwo()],
        ),
      ),
    );
  }
}

class ChildOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildOneState();
  }
}

class ChildOneState extends State<ChildOne> {
  @override
  Widget build(BuildContext context) {
    //rebuildOnChange属性能够控制当该状态发生变化时，是否rebuild，作用等同于setState。也就是说我们调用改变状态的一些方法时，不必再setState。
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Container(
          child: Column(
            children: <Widget>[
              Text(
                model.count.toString(),
                style: TextStyle(
                  letterSpacing: 1,
                  color: UIHelp.color_2E2F33,
                  fontSize: UIHelp.fontSize17,
                ),
              ),
              RaisedButton(
                child: Text("button"),
                onPressed: () => model.increment(),
              )
            ],
          ),
        );
      },
    );
  }
}
/*----------------------------------------------------*/

class ChildTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildTwoState();
  }
}

class ChildTwoState extends State<ChildTwo> {
  @override
  Widget build(BuildContext context) {
    //rebuildOnChange属性能够控制当该状态发生变化时，是否rebuild，作用等同于setState。也就是说我们调用改变状态的一些方法时，不必再setState。
    return ScopedModelDescendant<CountModel>(
      rebuildOnChange: true,
      builder: (context, child, model) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          color: Colors.pink,
          child: Text(
            model.mesage.toString(),
            style: TextStyle(
              letterSpacing: 1,
              color: UIHelp.color_FFFFFF,
              fontSize: UIHelp.fontSize17,
            ),
          ),
        );
      },
    );
  }
}




/**自定义的CountModel继承至Model。
 * 在状态发生变化时（increment）
 * 通知所有用到了该model的子项更新状态。
 * (notifyListeners)
 * */
class CountModel extends Model {
  int _count = 0;
  var _mesage = "我是子布局2,点击布局1里面的button 改变数据源  布局2会跟这刷新";

  get count => _count;

  get mesage => _mesage;

  void increment() {
    _count++;
    _mesage = "我是子布局2-->我变了${_count}";
    notifyListeners();
  }

  //第二种获取model的方式——使用ScopedModel.of
  //重写of方法,rebuildOnChange属性默认为false，所以会导致无法刷新（同步）状态的情况发生，需要手动指定rebuildOnChange：true。
  CountModel of(context) => ScopedModel.of<CountModel>(context);
}

