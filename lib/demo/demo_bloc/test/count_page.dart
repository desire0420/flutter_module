import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      child: BlocBuilder<CounterBloc, List<String>>(
        builder: (BuildContext context, List<String> list) {
          return new Column(
            children: <Widget>[
              Text(
                '${list.length}',
                style: TextStyle(fontSize: 24.0),
              ),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.increment);
                },
              ),
              RaisedButton(
                child: Icon(Icons.remove),
                onPressed: () {
                  _counterBloc.dispatch(CounterEvent.decrement);
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list[index]),
                    onTap: () {
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
