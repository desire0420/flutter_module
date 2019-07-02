import 'package:flutter/material.dart';
import 'package:flutter_module/demo/drawer_demo.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';

import '../model/post.dart';

//创建第一个列表 类似ListView
class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: oneListItemBuilder,
        ),
        //侧滑菜单
        drawer: new DrawerDemo());
  }
}

//列表的item
Widget oneListItemBuilder(BuildContext context, int index) {
  return new GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainDetailDemo(post: posts[index])));
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
          Text(posts[index].title,
              style: TextStyle(fontSize: 15, color: Colors.green)),
          SizedBox(height: 10.0),
          Text(posts[index].author,
              style: TextStyle(fontSize: 16, color: Colors.red)),
        ],
      ),
    ),
  );
}
