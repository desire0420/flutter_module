import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


/**原生提供了用于Widget间共享数据的InheritedWidget，当InheritedWidget发生变化时，它的子树中所有依赖了它的数据的Widget都会进行rebuild，这使得开发者省去了维护数据同步逻辑的麻烦。*/
class CountContainer extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;

  CountContainer({
    this.count,
    this.increaseCount,
    Widget child,
  }) : super(child: child);

  //在其他小部件里面调用  既可以得到State 由此便实现了数据的同步。
  static CountContainer of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CountContainer);

  // Flutter 判断 InheritedWidget是否需要重建，从而通知下层观察者组件更新数据。
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class InheritedTestModel {
  final int count;

  const InheritedTestModel(this.count);
}
