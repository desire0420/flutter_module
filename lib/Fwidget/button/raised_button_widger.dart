import 'package:flutter/material.dart';

class FLRaisedButton extends StatelessWidget {
  FLRaisedButton(
      {Key key,
      this.textStyle,
      this.btnTxt,
      this.onPressed,
      this.margin,
      this.padding,
      this.bgColor,
      this.disabledColor,
      this.textColor,
      this.disabledTextColor,
      this.minWidth,
      this.shape,
      this.isEnable = true,
      this.height})
      : super(key: key);

  final VoidCallback onPressed;
  final TextStyle textStyle;
  final String btnTxt;
  final Color bgColor;
  final Color disabledColor;
  final Color textColor;
  final Color disabledTextColor;
  final double minWidth;
  final double height;
  final bool isEnable;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: minWidth ?? double.infinity,
      height: height ?? 46,
      margin: margin ?? EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: RaisedButton(
        onPressed: isEnable ? onPressed : null,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
        textColor: textColor ?? Color(0xFFFFFFFF),
        color: bgColor ?? Color(0xFF7F57DB),
        disabledColor: disabledColor ?? Color(0xFFE5E5E5),
        disabledTextColor: disabledTextColor ?? Color(0xFFB8BCCC),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(5.0),
          child: new Text(btnTxt,
              style: textStyle ?? TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
