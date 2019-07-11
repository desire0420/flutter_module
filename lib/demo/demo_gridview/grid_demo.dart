import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';
import 'package:flutter_module/model/post.dart';

class GridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MainDetailDemo(
                desc: '福利',
                url:
                    'https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg')));
      },
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: TitleBar('GridView'),
        body: GridView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: posts.length,
          itemBuilder: _gridItemBuilder,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160.0, // 最大副轴长度,最大宽度
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 18.0,
          ),
        ));
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.yellow,
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: TitleBar('GridView'),
      body: GridView.count(
        crossAxisCount: 3,
        //每一行的个数
        crossAxisSpacing: 10.0,
        //垂直方向的间距
        mainAxisSpacing: 10.0,
        //水平方向的间距
        scrollDirection: Axis.vertical,
        //滚动方式
        children: buildTiles(100),
      ),
    );
  }
}
