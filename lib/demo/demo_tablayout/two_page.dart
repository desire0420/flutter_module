import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Image.asset('images/pic4.jpg'),
          new Divider(),
          new Image(
            image: new AssetImage('images/lifecycle.png'),
          ),
          new Divider(),
        ],
      ),
    );
  }
}
