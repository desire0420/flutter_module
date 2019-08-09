import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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

/**原生提供了用于Widget间共享数据的InheritedWidget，当InheritedWidget发生变化时，它的子树中所有依赖了它的数据的Widget都会进行rebuild，这使得开发者省去了维护数据同步逻辑的麻烦。*/
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;

  CounterProvider({
    this.count,
    this.increaseCount,
    Widget child,
  }) : super(child: child);

//在其他小部件里面调用  既可以得到State 由此便实现了数据的同步。
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  //时候通知继承小部件的小部件
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class InheritedTestModel {
  final int count;

  const InheritedTestModel(this.count);
}
