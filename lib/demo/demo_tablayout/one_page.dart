import 'package:flutter/material.dart';

const String imgNormalUrl =
    'https://resources.ninghao.org/images/undo.jpg';

const String imgGifUrl =
    'http://5b0988e595225.cdn.sohucs.com/images/20171114/ec6bbe932f204917bea84b58d2c3b174.gif';

const int loadNormalImg = 0;
const int loadGifImg = 1;
const int loadImgWithCache = 2;
const int loadImgWithFade = 3;

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new ImageNetDemo());
  }
}

class ImageNetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ImageNetState();
  }
}

class ImageNetState extends State<ImageNetDemo> {
  int curLoadWay = loadNormalImg;
  String curImageUrl = imgNormalUrl;

  _loadNormalImg() {
    curLoadWay = loadNormalImg;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  _loadGifImg() {
    curLoadWay = loadGifImg;
    curImageUrl = imgGifUrl;
    setState(() {});
  }

  _loadImgWithCache() {
    curLoadWay = loadImgWithCache;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  _loadImgWithFade() {
    curLoadWay = loadImgWithFade;
    curImageUrl = imgNormalUrl;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        key: new PageStorageKey(ImageNetState),
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                child: new Text('加载普通图片'), onPressed: _loadNormalImg),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                child: new Text('加载gif图片'), onPressed: _loadGifImg),
          ),
          new ImageView(curImageUrl, curLoadWay),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final String imgUrl;
  final int loadWay;

  ImageView(this.imgUrl, this.loadWay);

  @override
  Widget build(BuildContext context) {
    Widget widget = new Icon(Icons.error);

    switch (loadWay) {
      case loadNormalImg:
      case loadGifImg:
        widget = new Image.network(imgUrl);
        break;
    }
    return widget;
  }
}
