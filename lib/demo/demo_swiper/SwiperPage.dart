import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("返回键点击了");
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('轮播组件'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Swiper(
              itemBuilder: _swiperBuilder,
              itemCount: 3,
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
              control: new SwiperControl(),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index个'),
            )),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      "http://via.placeholder.com/350x150",
      fit: BoxFit.fill,
    ));
  }
}
