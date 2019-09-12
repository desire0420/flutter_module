import 'package:flutter/material.dart';
import 'package:flutter_module/common/ui_help.dart';
import 'package:flutter_module/model/post.dart';

//滑动列表   类似于ViewPager效果
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: UIHelp.color_FFFFFF, child: new PageViewBuilderDemo());
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Container(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
          ),
          //在Stack  里面布局方式
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(posts[index].author),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      //视图滚动的方向。
      scrollDirection: Axis.horizontal,
      //pageView每次滑动一半以上就会翻页 一半以下就会弹回来 如果不想这么做设置为false
      pageSnapping: true,
      controller: PageController(viewportFraction: 0.8),
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //pageView每次滑动一半以上就会翻页 一半以下就会弹回来 如果不想这么做
      // pageSnapping: false,
      //是否反方向。
      // reverse: true,
      //视图滚动的方向。
      scrollDirection: Axis.vertical,
      //索引改变时触发。
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
        //进入页面显示的位置
        initialPage: 0,
        // 是否记住当前页面
        keepPage: false,
        // 当前页面占屏幕比例0-1 这个占比是根据滚动方向调整的
        viewportFraction: 0.85,
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
