import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      child: BlocBuilder<CounterBloc, int>(
        builder: (BuildContext context, int count) {
          return new Column(
            children: <Widget>[
              Text(
                '$count',
                style: TextStyle(fontSize: 24.0),
              ),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.increment);
                },
              ),
              RaisedButton(
                child: Icon(Icons.close),
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.increment);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

/* return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$count',
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _counterBloc.dispatch(CounterEvent.increment);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    _counterBloc.dispatch(CounterEvent.decrement);
                  },
                ),
              ),
            ],
          );*/
