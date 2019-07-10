import 'package:flutter/material.dart';

//点击后的详情页
class MainDetailDemo extends StatelessWidget {
  final String desc;
  final String url;

  MainDetailDemo({@required this.desc, this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            tooltip: 'Navigation menu',
            onPressed: () => Navigator.pop(context), //点击事件
          ),
          title: new Text(
            desc,
            style: TextStyle(fontSize: 15),
          ),
          centerTitle: true,
        ),
        body: creatBody(desc: desc, url: url));
  }
}

class creatBody extends StatelessWidget {
  final String desc;
  final String url;

  creatBody({@required this.desc, this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SingleChildScrollView(
      child: new Container(
        color: Color(0xFFFFFFFF),
        child: new Column(
          mainAxisSize: MainAxisSize.min, //如果没设置主轴  则则默认占满最大屏幕空间
          children: <Widget>[
            new Image.network(
              url,
              width: double.infinity,
              height: 600,
              fit: BoxFit.cover,
            ),
            DetailStart(),
            DetailMiddle(),
            new Container(
              padding: EdgeInsets.all(20),
              child: new Text(
                  "Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run,Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run,Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan runLake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run"
                  "Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run,Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run,Lake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan runLake Oeschinen lies at the foot of"
                  " the Blüemlisalp in the Bernese Alps. Situated 1,578 meters "
                  "above sea level, it is one of the larger Alpine Lakes. A gondola"
                  " ride from Kandersteg, followed by a half-hour walk through pastures"
                  " and pine forest, leads you to the lake, which warms to 20 degrees "
                  "Celsius in the summer. Activities enjoyed here include rowing, and"
                  " riding the summer toboggan run",
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr, //文本方向
                  style: new TextStyle(
                    wordSpacing: 2.0,
                    //单词间隙(负值可以让单词更紧凑)
                    letterSpacing: 1.0,
                    //字母间隙(负值可以让字母更紧凑)
                    fontSize: 16.0,
                    //字体大小
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff383838), //文字颜色
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class DetailStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        children: [
          //Expanded -Row、Column、Flex会被Expanded撑开，充满主轴可用空间。
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          new Text('41'),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  IconData icon;
  String label;

  Box(IconData icon, String label) {
    this.icon = icon;
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon, color: Colors.blue),
        new Container(
            padding: EdgeInsets.only(top: 10),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ))
      ],
    );
  }
}

class DetailMiddle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        elevation: 1.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: new Container(
          padding: EdgeInsets.all(10),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Box(Icons.call, "CALL"),
              Box(Icons.near_me, "ROUTE"),
              Box(Icons.share, "SHARE"),
            ],
          ),
        ));
  }
}
