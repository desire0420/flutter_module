import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'count_page.dart';
import 'counter_bloc.dart';

class CountBlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
          elevation: 0.0,
        ),
        body: CounterPage(),
      ),
    );
  }
}

class CountBlocDemo1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<CountBlocDemo1> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
          elevation: 0.0,
        ),
        body: CounterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
