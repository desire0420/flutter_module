import 'package:flutter/material.dart';

//基本组件的用法   BoxDecoration
class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //装饰背景
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'http://img.zcool.cn/community/01dc60554bf752000001bf72fa836b.jpg@1280w_1l_2o_100sh.png'),
          alignment: Alignment.topCenter,
          // repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          //滤镜效果
//          colorFilter: ColorFilter.mode(
//            Colors.indigoAccent[400].withOpacity(0.5),
//            BlendMode.hardLight,
//          ),
        ),
      ),
      //可滚动布局
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ), //上下布局形成30的间隔
            nativeDemo(),
            ButtonDemo(),
            RowDemo(),
            ImageDemo(),
            RichTextDemo(),
            TextDemo(),
            radiuDemo(),
            sizeBoxDemo(),
            StackDemo(),
            //  AspectRatioDemo(),
            ConstrainedBoxDemo(),
          ],
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new MaterialButton(
      onPressed: () {},
      child: new Text('Hello'),
      color: Colors.blue,
      padding: new EdgeInsets.only(left: 20.0, right: 10.0),
    ));
  }
}

class nativeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Image.asset(
          'images/pic1.jpg',
          width: 300,
          height: 100,
        ),
        new Text("上面加载本地图片")
      ],
    );
  }
}

//水平摆几个控件
class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      // textDirection: TextDirection.rtl, //排版从右到左
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Box("水平"), Box("均衡"), Box("排列")],
    );
  }
}

class Box extends StatelessWidget {
  String index;
  double size = 80;

  Box(String index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.red),
      child: new Text(
        index,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Row(
      children: <Widget>[
        Image.network(
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=935292084,2640874667&fm=27&gp=0.jpg',
          width: 200,
          height: 100,
        ),
        new Text("网络图片加载显示")
      ],
    ));
  }
}

//限制最大（小）宽高
class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50.0,
        maxWidth: 50.0,
      ),
      child: Container(
        color: Colors.blue,
        child: new Text("限制最大宽"),
      ),
    );
  }
}

//设置宽高比例
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.0 / 3.0,
      child: new Container(
        child: new Text(
          "设置宽高比例",
          style: TextStyle(),
        ),
      ),
    );
  }
}

//追加文字
class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '王伟';
  final String _title = 'hello';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '《 $_title 》—— $_author。君不见黄河之水天上来',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//字体样式不一样
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '字体样式不一样',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 12.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: '.不一样了',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 17.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class radiuDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Icon(Icons.pool, size: 32.0, color: Colors.blue),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.red,
        //边框
        border: Border.all(
          color: Colors.indigoAccent[100],
          width: 3.0,
          style: BorderStyle.solid,
        ),
        //shadow
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 16.0),
            color: Color.fromRGBO(16, 20, 188, 1.0),
            blurRadius: 25.0,
            spreadRadius: -9.0,
          ),
        ],
        //圆角
        borderRadius: BorderRadius.circular(10),
        //渐变
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(7, 102, 255, 1.0),
            Color.fromRGBO(3, 28, 128, 1.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

//sizeBox  固定子view 的宽高,固定尺寸
class sizeBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          SizedBox(
            child: new Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5)),
              child: new Text("固定View的大小",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            width: 100,
            height: 60,
          ),
          SizedBox(
            height: 30,
          ), //上下布局形成30的间隔
          SizedBox(
            child: new Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: new Text("上面设置了间距"),
            ),
            width: 100,
            height: 30,
          ),
        ],
      ),
    );
  }
}

//Stack  层叠 类似FrameLayout
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerRight, //设置对齐方式
      child: new Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                child: new Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: new Text("层叠 类似FrameLayout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
                width: 120,
                height: 60,
              ),
              SizedBox(
                child: new Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5)),
                  child: new Text("层叠",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ),
                width: 50,
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
