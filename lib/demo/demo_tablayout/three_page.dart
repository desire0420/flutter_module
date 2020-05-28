import 'package:flutter/material.dart';
import 'package:flutter_module/common/decoration_style.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TextFieldState();
  }
}

class TextFieldState extends State<TextFieldDemo> {
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new TextField(
            //监听输入框输入
            onChanged: (value) {
              print("---->value--$value");
            },
            controller: textEditingController,
            //光标颜色
            cursorColor: Color(0xFF7F57DB),
            //光标宽度
            cursorWidth: 2.0,
            //光标圆角弧度
            cursorRadius: Radius.circular(5.0),
            style: TextStyle(fontSize: 14, color: Color(0xFF5C5E66), letterSpacing: 1),
            decoration: DecorationStyle.searchInputDecoration("搜索附近位置"),
          ),
          new TextField(
            onChanged: (value) {

            },
            maxLength: 2000,
            maxLines: 7,
            textInputAction: TextInputAction.done,
            controller: textEditingController,
            //光标颜色
            cursorColor: Color(0xFF7F57DB),
            //光标宽度
            cursorWidth: 2.0,
            //光标圆角弧度
            cursorRadius: Radius.circular(5.0),
            //Textfield 光标和hint文字一直对不齐 TextStyle(textBaseline: TextBaseline.alphabetic)
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFF5C5E66),
                letterSpacing: 1,
                textBaseline: TextBaseline.alphabetic),
            decoration: DecorationStyle.inputDecoration(
                bgColor: Color(0xFFFFFFFF),
                hintTestStyle: TextStyle(fontSize: 14, color: Color(0xFFB8BCCC)),
                hintText: "分享此刻，让TA在人群中找到你"),
          ),
        ],
      ),
    );
  }
}
