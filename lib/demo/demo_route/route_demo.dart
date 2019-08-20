import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:flutter_module/demo/demo_lifecycle/life_recyle_test.dart';
import 'package:flutter_module/demo/main_detail_demo.dart';

class RouteDemo extends StatelessWidget {
  var _result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: TitleBar('Route-路由'),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
              'Material库中提供了一个MaterialPageRoute，它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，而在Android上会上下滑动切换。如果在Android上也想使用左右切换风格，可以直接使用CupertinoPageRoute'),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainDetailDemo(
                      desc: '详情',
                      url:
                          'https://ws1.sinaimg.cn/large/0065oQSqly1f ytdr77urlj30sg10najf.jpg')));
            },
            child: new Text('MaterialPageRoute'),
            textColor: Colors.black,
          ),
          new RaisedButton(
            onPressed: () => Navigator.pushNamed(context, '/detail'),
            child: new Text('定义根路由'),
            textColor: Colors.black,
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new CupertinoPageRoute(
                      builder: (context) => LiferecyleTest()));
            },
            child: new Text('CupertinoPageRoute'),
            textColor: Colors.black,
          ),
          new Text('如果想自定义路由切换动画，可以使用PageRouteBuilder，例如我们想以渐隐渐入动画来实现路由过渡：'),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      //动画时间为500毫秒
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return new FadeTransition(
                            //使用渐隐渐入过渡,
                            opacity: animation,
                            child: LiferecyleTest()); //路由B
                      }));
            },
            child: new Text('PageRouteBuilder'),
            textColor: Colors.black,
          ),
          new RaisedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/twoRouter').then((value) {
              print('_result' + _result);
              _result = value;
            }),
            child: new Text('根路由实现-startActivityForResult'),
            textColor: Colors.black,
          ),
          new RaisedButton(
            onPressed: () => Navigator.pushNamed(context, '/unknowrouter'),
            child: new Text('未定义的路由'),
            textColor: Colors.black,
          ),
          new RaisedButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/transmit_param', arguments: 'hello'),
            child: new Text('打开页面时传递字符串参数'),
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
