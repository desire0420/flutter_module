import 'package:flutter/material.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';
import 'package:flutter_module/model/post.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (context) => MainDetailDemo(post: posts[0])));
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              buildColumn(),
              buildColumn(),
            ],
          ),
        ));
  }
}

/**行*/
Widget buildColumn() {
  return new Expanded(
      flex: 1,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                buildItem(1, Colors.red, "one"),
                SizedBox(
                  width: 10,
                ),
                buildItem(1, Colors.green, "two"),
              ]),
        ],
      ));
}

/**权重*/
Widget buildItem(int flex, Color color, String text) {
  return new Expanded(
      flex: flex,
      child: new Container(
        color: Colors.white,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/pic7.jpg',
                fit: BoxFit.cover,
              ),
              new Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    text,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ))
            ]),
      ));
}

/**wrap_content"属性相当于Row/Column组件里面的 MainAxisSize.min 属性。
 * MainAxisSize.max match_parent
 * */
/* new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Container(
                      width: double.infinity,
                      child: new Image.asset(
                        'images/pic6.jpg',
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          '才俊佳丽',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ))
                  ]),*/
