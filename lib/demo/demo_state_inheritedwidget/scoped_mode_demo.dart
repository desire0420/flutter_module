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
