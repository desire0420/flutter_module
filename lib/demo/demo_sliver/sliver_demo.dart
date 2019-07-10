import 'package:flutter/material.dart';
import 'package:flutter_module/model/post.dart';

//折叠布局 的实现   类似
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          //里面包含了AppBar的所有属性,可以实现导航栏效果
          new SliverAppBar(
            //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
            expandedHeight: 200.0,
            //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
            floating: false,
            //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              title: new Text(
                "大漠孤烟直，长河落日圆",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: new Image.asset(
                'images/pic3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          new SliverSafeArea(
            sliver: SliverPadding(
                padding: EdgeInsets.all(8.0), sliver: SliverListDemo()),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return new Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Image.network(
                  posts[index].imageUrl,
                  width: 120,
                  height: 100,
                ),
                new Container(
                  padding: EdgeInsets.only(left: 20),
                  child: new Column(
                    children: <Widget>[
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        posts[index].author,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
