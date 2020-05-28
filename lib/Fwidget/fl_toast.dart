import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_module/Fwidget/text_widget.dart';

class FLToast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
      int gravity = 1,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      FLToastType type = FLToastType.text}) {
    ToastView.dismiss();
    ToastView.createView(msg, context, duration, gravity, backgroundColor, textColor, type);
  }
}

enum FLToastType { text, success, error, info }

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(String msg, BuildContext context, int duration, int gravity,
      Color background, Color textColor, FLToastType type) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Container(
                    decoration: BoxDecoration(
                      color: background.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _typeWidget(type),
                          FLText(text: msg, textStyle: TextStyle(fontSize: 15, color: textColor))
                        ])),
              )),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(Duration(seconds: duration == null ? FLToast.LENGTH_SHORT : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

IconData iconType(FLToastType type) {
  if (type == FLToastType.success) {
    return Icons.check_circle_outline;
  } else if (type == FLToastType.info) {
    return Icons.info_outline;
  } else if (type == FLToastType.error) {
    return Icons.highlight_off;
  } else {
    return null;
  }
}

Widget _typeWidget(FLToastType type) {
  if (type == FLToastType.text) {
    return new Container(
      width: 0,
      height: 0,
    );
  } else {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Icon(
        iconType(type),
        size: 23,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? 50 : null,
        bottom: gravity == 0 ? 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
