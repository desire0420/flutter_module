import 'package:flutter/material.dart';

//渐变Button
class FLLinearGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTxt;
  final double minWidth;
  final double height;
  final EdgeInsetsGeometry margin;

  final Gradient gradient;
  final TextStyle textStyle;

  FLLinearGradientButton(
      {Key key,
      @required this.btnTxt,
      this.textStyle,
      @required this.gradient,
      this.onPressed,
      this.margin,
      this.minWidth,
      this.height})
      : assert(btnTxt != null),
        assert(gradient != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: minWidth ?? double.infinity,
      height: height ?? 46,
      margin: margin ?? EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration:
          BoxDecoration(gradient: gradient, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: FlatButton(
        onPressed: () {
          onPressed();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(btnTxt,
            style: textStyle ??
                TextStyle(color: Color(0xFFFFFFFF), fontSize: 15, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
