import 'package:flutter/material.dart';

class FLLoadingButton extends StatefulWidget {
  FLLoadingButton({
    Key key,
    this.child,
    @required this.onPressed,
    this.textTheme,
    this.textColor,
    this.color,
    this.onHighlightChanged,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.disabledTextColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.hoverElevation,
    this.focusElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.indicatorOnly = false,
    this.indicatorColor,
    this.indicatorSize,
    this.loading = false,
    this.margin
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final ButtonTextTheme textTheme;
  final ValueChanged<bool> onHighlightChanged;
  final Color textColor;
  final Color color;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color disabledTextColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final double elevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final double disabledElevation;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final Duration animationDuration;
  final double minWidth;
  final double height;
  final Color indicatorColor;
  final double indicatorSize;
  final bool indicatorOnly; //点击后只显示进度条
  final bool loading;
  final EdgeInsetsGeometry margin;

  @override
  State<FLLoadingButton> createState() => FLLoadingButtonState();
}

class FLLoadingButtonState extends State<FLLoadingButton> {
  @override
  Widget build(BuildContext context) {
    //进度条颜色
    final Color indColor = widget.indicatorColor ?? Color(0xFFf8f8f8);
    final Widget indicator = Transform.scale(
        scale: 0.6, //进度条缩放至0.4倍
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(indColor),
        ));

    Widget loadingChild;
    if (widget.loading && widget.indicatorOnly) {
      loadingChild = indicator;
    } else if (widget.loading && !widget.indicatorOnly) {
      loadingChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[indicator, SizedBox(width: 5.0), widget.child],
      );
    } else {
      loadingChild = widget.child;
    }

    return Container(
      width: widget.minWidth ?? double.infinity,
      height: widget.height ?? 46,
      margin: widget.margin ?? EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: RaisedButton(
        onPressed: widget.loading ? null : widget.onPressed,
        textTheme: widget.textTheme,
        color: widget.color ?? Color(0xFF7F57DB),
        onHighlightChanged: widget.onHighlightChanged,
        disabledColor: widget.disabledColor ?? Color(0xFFE5E5E5),
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        highlightColor: widget.highlightColor,
        textColor: widget.textColor ?? Color(0xFFFFFFFF),
        disabledTextColor: widget.disabledTextColor ?? Color(0xFFf8f8f8),
        splashColor: widget.splashColor,
        colorBrightness: widget.colorBrightness,
        elevation: widget.elevation,
        focusElevation: widget.focusElevation,
        hoverElevation: widget.hoverElevation,
        highlightElevation: widget.highlightElevation,
        disabledElevation: widget.disabledElevation,
        padding: widget.padding,
        shape: widget.shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        animationDuration: widget.animationDuration,
        child: loadingChild,
      ),
    );
  }
}
