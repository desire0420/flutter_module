import 'dart:ui';

import 'package:flutter/material.dart';

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

/// 底部弹出框
// ignore: must_be_immutable
class CommonBottomSheet extends StatefulWidget {
  CommonBottomSheet({Key key, this.dataSource, this.chooseStr = '', this.isLimitNum = 100, this.sureCallBack})
      : assert(dataSource != null),
        super(key: key);

  var dataSource; //数据源 map
  Function sureCallBack; //确定按钮回调
  String chooseStr; //选择过的
  int isLimitNum; //允许选择的个数
  @override
  CommonBottomSheetState createState() {
    return CommonBottomSheetState();
  }
}

class CommonBottomSheetState extends State<CommonBottomSheet> {
  List chooseList = new List();

  @override
  void initState() {
    super.initState();
    if (widget.chooseStr.isNotEmpty) {
      chooseList = widget.chooseStr.split(",");
    }
  }

  void clickSureBtn() {
    StringBuffer str = new StringBuffer();
    for (int i = 0; i < chooseList.length; i++) {
      if (i == 0) {
        str.write(chooseList[i]);
      } else {
        str.write("," + chooseList[i]);
      }
    }
    widget.sureCallBack(str.toString());
    Navigator.pop(context);
  }

  void itemClick(String key) {
    if (chooseList.contains(key)) {
      chooseList.remove(key);
    } else if (widget.isLimitNum == 1) {
      //选择一个情况  点击未选择过的 要清除已经选择的
      if (!chooseList.contains(key)) {
        chooseList.clear();
        chooseList.add(key);
      }
    } else if (chooseList.length >= widget.isLimitNum) {
      print('-----最多能选择--${widget.isLimitNum}个');
    } else {
      chooseList.add(key);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;
    var deviceWidth = orientation == Orientation.portrait ? screenSize.width : screenSize.height;
    return Scaffold(
      backgroundColor: Color(0x00000000),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              color: Color(0xFFFFFFFF),
              height: ((widget.dataSource.length) * 50).toDouble(),
              width: deviceWidth,
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('取消'),
                      ),
                      new FlatButton(
                        onPressed: () {
                          clickSureBtn();
                        },
                        child: Text('确定'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: mostCare.keys.map((key) {
                          return InkWell(
                            onTap: () {
                              itemClick(key);
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Checkbox(
                                      value: chooseList.contains(key),
                                      onChanged: (bool value) {
                                        setState(() {});
                                      },
                                    ),
                                    Text(mostCare[key])
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  color: Color(0xFFdddddd),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
