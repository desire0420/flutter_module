import 'package:flutter/material.dart';

import 'demo_dialog/CommonBottomSheet.dart';
import 'demo_dialog/bottom_dialog.dart';

const mostCare = {
  '160': '年龄',
  '161': '学历',
  '162': '收入',
  '163': '身高',
  '164': '地域',
  '165': '婚姻',
  '166': '颜值',
  '167': '性格',
  '185': '身材',
  '186': '工作地',
};

final topTitles = ['审批单', '机票列表', '客服'];

class MapListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DialogStudyState();
  }
}

class DialogStudyState extends State<MapListDemo> {
  show() {
    print('-----5555555--${mostCare.length}'); //List转为Map
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return CommonBottomSheet(
              dataSource: mostCare,
              chooseStr: '161,186',
              isLimitNum: 4,
              sureCallBack: (str) {
                print('-----------------' + str);
              });
        });
  }

  //map
  bianliMap() {
    modalBottomSheetMenu(context);
    mostCare.forEach((k, v) {
      // print(k + "==" + v.toString()); //类型不一样的时候就toString()
    });
    topTitles.forEach((item) => {print(item)});

    mostCare.keys.forEach((f) {
      // print(f); //打印所有的key
    });

    mostCare.values.forEach((f) => print(f)); //打印所有的value
    // print('-----5555555--${topTitles.asMap()}');//List转为Map
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  bianliMap();
                },
                child: Text('button'),
              ),
              new RaisedButton(
                onPressed: () {
                  show();
                },
                child: Text('show'),
              ),
              Row(
                children: topTitles
                    .asMap()
                    .keys
                    .map((f) => Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[Text(topTitles[f])],
                          ),
                        ))
                    .toList(),
              ),
              Row(
                children: mostCare.keys.map((key) {
                  //  print('-----key--${key}');
                  return Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[Text(mostCare[key])],
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
