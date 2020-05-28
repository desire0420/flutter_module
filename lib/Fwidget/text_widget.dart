import 'package:flutter/material.dart';

class FLText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;
  final TextAlign textAlign;

  FLText({
    Key key,
    @required this.text,
    this.textAlign,
    this.textStyle,
    this.padding,
    this.margin,
    this.onPressed,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding,
        margin: margin,
        child: Text(
          text,
          textAlign: textAlign ?? TextAlign.start,
          softWrap: true,
          style: textStyle,
        ),
      ),
    );
  }
}
