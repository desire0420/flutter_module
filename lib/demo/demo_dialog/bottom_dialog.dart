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

void modalBottomSheetMenu(BuildContext context) {
  bool s=false;
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 260,
          child: Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    child: Text('取消'),
                  ),
                  new FlatButton(
                    onPressed: () {},
                    child: Text('确定'),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: new Container(
                    child: Column(
                      children: mostCare.keys.map((key) {
                        print('-----key--${key}');
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Checkbox(
                                    value: s,
                                    onChanged: (bool value) {

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
                ),
              ),
            ],
          ),
        );
      });
}
