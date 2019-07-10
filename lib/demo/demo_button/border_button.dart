import 'package:flutter/material.dart';

/**有边框的按钮*/
class BorderButton extends StatelessWidget {
  String text;

  BorderButton(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
          left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      height: 48.0,
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      child: new Text(text),
    );
  }
}
