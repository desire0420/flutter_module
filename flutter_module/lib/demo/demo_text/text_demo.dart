import 'package:flutter/material.dart';

class TextDemoTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var paint = new Paint();
    paint.color = Color(0xFF00FF00);

    var shadowList = [
      new Shadow(color: Color(0xFFFF0000), offset: Offset(3, 3), blurRadius: 3)
    ];

    return new SingleChildScrollView(
        child: Column(
      children: <Widget>[

        Row(
          children: <Widget>[
            Text('字体颜色:'),
            Text(
              '字体颜色是红色',
              style: TextStyle(color: Color(0xFFFF0000)),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('字体大小:'),
            Text(
              '字体大小默认',
            ),
            Text(
              '字体大小30',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('字体粗细:'),
            Text(
              '默认',
            ),
            Text(
              '粗体',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('字体:'),
            Text(
              '字体-默认',
            ),
            Text(
              '字体-italic',
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('字母间距:'),
            Text('字母间距默认'),
            Text(
              '字母间距:-5,absccc',
              style: TextStyle(letterSpacing: -5),
            ),
            Text(
              '字母间距:5,absccc',
              style: TextStyle(letterSpacing: 5),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('单词间距:'),
            Text('单词间距默认'),
            Text(
              '单词间距:-5,hello word',
              style: TextStyle(wordSpacing: -5),
            ),
            Text(
              '单词间距:5,hello word',
              style: TextStyle(wordSpacing: 5),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('foreground:'),
            Text(
              'Paint 设置颜色为绿色',
              style: TextStyle(foreground: paint),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('background:'),
            Text(
              '背景设置为绿色',
              style: TextStyle(background: paint),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text('阴影:'),
            Text(
              '背景阴影',
              style: TextStyle(
                shadows: shadowList,
              ),
            )
          ],
        ),
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
            Text('对齐方式:'),
            Container(
              width: 300,
              height: 50,
              color: Color(0xFFFF0000),
              child: Text(
                '右对齐',
                textAlign: TextAlign.right,
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
                '中间对齐',
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
              child: Text(r'$$  Double dollars $$',
                  semanticsLabel: 'Double dollars'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Hello', //
                children: <TextSpan>[
                  TextSpan(
                      text: ' beautiful ',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'world',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
