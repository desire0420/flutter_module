import 'package:flutter/material.dart';

import 'child_one.dart';
import 'child_two.dart';

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParentState();
  }
}

class ParentState extends State<ParentWidget> {
  String data = "无";
  String dataTwo = "传递给组件2的值";

  @override
  Widget build(BuildContext context) {
    onChanged(value) {
      setState(() {
        data = value;
      });
    }

    return new Scaffold(
      appBar: AppBar(
        title: new Text('组件之间的通讯'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: new Container(
            color: Colors.white,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.white),
                          width: double.infinity,
                          child: new Column(
                            children: <Widget>[
                              Text(
                                '我是父容器 ',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '子组件2，传过来的值' + '$data',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),


                      new childOne(),
                      SizedBox(
                        height: 10,
                      ),

                      new childTwo(
                          dataTwo: dataTwo,
                          callBack: (value) => onChanged(value)),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
