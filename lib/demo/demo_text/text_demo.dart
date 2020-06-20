import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextDemoTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text('文字划线:'),
              Text(
                '下划线',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text(
                '上划线',
                style: TextStyle(
                    decoration: TextDecoration.overline,
                    decorationStyle: TextDecorationStyle.dotted),
              ),
              Text(
                '中划线',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xFFFF0000),
                    decorationStyle: TextDecorationStyle.double),
              ),
              Text(
                '中划线',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xFFFF0000),
                    decorationStyle: TextDecorationStyle.solid),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text('对齐方式:'),
              Container(
                color: Color(0xFFFF0000),
                child: Text(
                  '左对齐',
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[

              Container(
                width: 300,
                height: 50,
                color: Color(0xFFFF0000),
                child: Text(
                  '右对齐方式',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 300,
                height: 50,
                color: Color(0xFFFF0000),
                child: Text(
                  '中间对齐方式',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('对齐方式:'),
              Container(
                width: 300,
                height: 50,
                color: Color(0xFFFF0000),
                child: Text(
                  'hello word \n dfsafdafafsasfs',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('方向：'),
              Container(
                width: 300,
                height: 50,
                color: Color(0xFFFF0000),
                child: Text(
                  'hello word \n dfsafdafafsasfs',
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('overflow：fade'),
              Container(
                width: 100,
                height: 50,
                color: Color(0xFF00FF00),
                child: Text(
                  'hello worddfsafdafafsasfs',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('overflow：ellipsis'),
              Container(
                width: 100,
                height: 50,
                color: Color(0xFF00FF00),
                child: Text(
                  'hello word dfsa fdaf afs asfs',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('semanticsLabel：'),
              Container(
                width: 400,
                height: 50,
                color: Color(0xFF00FF00),
                child: Text(r'$$  Double dollars $$', semanticsLabel: 'Double dollars'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: 'Hello', //
                  children: <TextSpan>[
                    TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          RichText(
            text: TextSpan(
              text: '特权：',
              style: TextStyle(
                  color:  Color(0xFFFF5398), fontSize: 13),
              children: <TextSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('点击了');
                    },
                  text: "一对一交往即双方以一对一的形式深入交往，回归最真诚和纯粹的情感。表态”我愿意“，能让对方感受到",
                  style: TextStyle(
                      color: Color(0xFF2E2F33),
                      fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),

          Text.rich(TextSpan(
              style: TextStyle(color: Color(0xFF2E2F33), fontSize: 14, height: 1.2),
              children: [
                TextSpan(
                  text: "一对一交往即双方以一对一的形式深入交往，回归最真诚和纯粹的情感。表态”我愿意“，能让对方感受到",
                ),
                TextSpan(
                  text: "诚意和承诺",
                  style: TextStyle(color: Color(0xFFFF5398), fontSize: 14),
                ),
                TextSpan(text: "，一定的承诺会增加双方的"),
                TextSpan(
                  text: "亲密度和信任感",
                  style: TextStyle(color: Color(0xFFFF5398), fontSize: 14),
                ),
                TextSpan(text: "，让感情加深许多哦"),
              ])),
        ],
      )),
    );
  }
}
