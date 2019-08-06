import 'package:flutter/material.dart';
import 'package:flutter_module/common/eventBus.dart';

class childTwo extends StatefulWidget {
  childTwo({Key key, this.dataTwo, this.callBack}) : super(key: key);
  final callBack;
  String dataTwo;

  @override
  State<StatefulWidget> createState() {
    return childTwoState();
  }
}

class childTwoState extends State<childTwo> {
  void transA() {
    widget.callBack('$inputText');
  }

  void transB() {
    //触发消息变化
    eventBus.fire(new TransEvent('$inputText'));
  }

  String data = '';
  String inputText;
  TextEditingController controller = new TextEditingController();

  void _onChanged(String value) {
    setState(() {
      inputText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.pink[100]),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(bottom: 15),
            child: new Text(
              '我是子组件2',
              style: TextStyle(fontSize: 15),
            ),
          ),
          new Text(
            '子组件2传过来的值',
            style: TextStyle(fontSize: 15),
          ),
          new TextField(
            controller: controller,
            decoration: (new InputDecoration(labelText: '请输入你要发送的值')),
            onChanged: _onChanged,
          ),
          new RaisedButton(
              onPressed: transA, child: new Text('把输入框里面的值传给-父组件')),
          new RaisedButton(
              onPressed: transB, child: new Text('把输入框里面的值传给-兄弟组件1')),
        ],
      ),
    );
  }
}
