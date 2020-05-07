import 'package:flutter/material.dart';
import 'package:flutter_module/model/post.dart';

import '../main_detail_demo.dart';

//创建第一个列表 类似ListView
class ImageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageListState();
  }
}

class ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: Container(
        height: 50,
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '相册',
                style: TextStyle(
                  color: Color(0xFF2E2F33),
                  fontSize: 15,
                ),
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("审核中-"),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 2,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.network(
                          "https://resources.ninghao.org/images/undo.jpg",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  new Text(">")
                ],
              )
            ]),
      ),

/*      body: new ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 120,
          itemBuilder: (context, item) {
            return Padding(padding: const EdgeInsets.all(8.0), child: new Text('${item}'));
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index == 2) {
              return new Container(
                height: 40.0,
                child: new Center(
                  child: new Text("类型1"),
                ),
                color: Colors.red,
              );
            } else {
              return new Divider();
            }
          } // 分割线
          ),*/
      //侧滑菜单drawer: new DrawerDemo()
    );
  }
}

//列表的item
Widget oneListItemBuilder(BuildContext context, int index) {
  return new GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MainDetailDemo(desc: '福利', url: 'https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg')));
    },
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 18.0),
          //比例控制View大小
          new AspectRatio(
            aspectRatio: 10 / 5,
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 18.0),
          Text(posts[index].title, style: TextStyle(fontSize: 15, color: Colors.green)),
          SizedBox(height: 10.0),
          Text(posts[index].author, style: TextStyle(fontSize: 16, color: Colors.red)),
        ],
      ),
    ),
  );
}
