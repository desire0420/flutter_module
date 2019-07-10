import 'package:flutter/material.dart';
import 'package:flutter_module/model/post.dart';

class CardStudyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CardStudyState();
  }
}

class CardStudyState extends State<CardStudyDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text("card"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: new Container(
          padding: EdgeInsets.all(16),
          //遍历map数据产生Card
          child: ListView(
            children: posts.map((post) {
              return Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          post.imageUrl,
                        ),
                      ),

                      title: Text(post.title),
                      subtitle: Text(post.author),
                    ),

                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        post.title + '------' + post.author,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text('Like'.toUpperCase()),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text('Read'.toUpperCase()),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
