import 'dart:io';

import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://resources.ninghao.org/images/candy-shop.jpg";
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Image.file(new File("/storage/xxx/xxx/test.jpg")),
          new Image.asset('images/pic4.jpg'),
          new Divider(),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage("images/zone_bg.png")),
            ),
          ),
          new Image(
            image: new AssetImage('images/lifecycle.png'),
          ),
          new Divider(),
          new Column(
            children: <Widget>[
              //使用裁剪来实现图片圆角：
              new ClipRRect(
                child: Image.network(
                  imageUrl,
                  scale: 8.5,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              SizedBox(height: 10),
              //利用BoxDecoration  实现
              new Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),

              //使用裁剪实现圆形图片：
              SizedBox(height: 10),

              new ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  scale: 8.5,
                ),
              ),

              //使用CircleAvatar来实现圆形图片：
              new CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
