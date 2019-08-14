import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

///定义所有 event 和 state
///    继承Bloc
///    重写 initialState 和 mapEventToState
///在这种情况下，我们的 events 是CounterEvents ,states 是 integers
class CounterBloc extends Bloc<CounterEvent, List<String>> {
  Future<List<String>> loadList() async {
    // 模拟网络请求
    await Future.delayed(Duration(milliseconds: 500));
    List<String> _list = [
      'CounterBloc. Scoped Model',
    ];
    return _list;
  }

  ///initialState是处理任何事件之前的状态（在mapEventToState被调用之前）。
  /// 如果未实现，则为initialState null。
  @override
  List<String> get initialState => new List(); //初始化结果;

  ///当一个类继承Bloc时，必须实现 mapEventToState 方法， 该函数将传入事件作为参数。
  /// 只要UI层触发一个事件，就会调用 mapEventToState。
  ///  mapEventToState 必须将该event转换为新state，并以UI层使用的Stream形式返回新状态。

  @override
  Stream<List<String>> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        final posts = await loadList();
        print('--increment---${currentState.length}');
        yield posts;
        break;
      case CounterEvent.decrement:
        final posts = await loadList();
        print('--decrement---${currentState.length}');
        yield posts;
        break;
    }
  }

  ///为了观察状state 的 转换（Transitions），我们可以重写onTransition。
  @override
  void onTransition(Transition<CounterEvent, List<String>> transition) {
    print('----onTransition------${transition}');
  }
}

/**transform

    transform是一个 在调用mapEventToState之前 可以重写以转换 Stream .
    这允许使用distinct() 和 debounce() 的操作。

    onTransition

    onTransition 是一个 每次 transform 发生时都可以重写以进行处理 的方法。
    调度新event 并调用mapEventToState时发生transition。
    onTransition 在更新 bloc 状态之前 被调用。
    这是添加特定于块的日志记录/分析的好地方

 */

/**词汇表
    Events
    Events 是Bloc的输入。它们通常是UI事件，例如按钮按下。Events被分发(dispatched)并且被转换为States。
    States
    States 是Bloc的输出。表示组件可以监听状态流 并根据给定状态重绘其自身的部分（BlocBuilder有关详细信息，请参阅参考资料）。
    Transitions
    Transitions 发生在 调用mapEventToState之后 但在更新了bloc的state之前 调度了一个Event
    现在我们了解事件和状态，我们可以看一下Bloc API。

 */
