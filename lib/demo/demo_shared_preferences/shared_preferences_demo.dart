import 'package:flutter/material.dart';
import 'package:flutter_module/common/app_bar_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = '';

String pwd = '';

const String USERNAME = 'username';

const String PWD = 'pwd';

class SharedPreferencesDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DataAppPageState();
  }
}

class _DataAppPageState extends State<SharedPreferencesDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: TitleBar('数据存储'),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('对用户名和密码进行增删改查的操作'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new LoginWidget(),
          ),
          new Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: new HandleSPDataWidget(),
          ),
        ],
      ),
    );
  }
}

class HandleSPDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HandleSPDataWidgetState();
  }
}

class _HandleSPDataWidgetState extends State<HandleSPDataWidget> {
  var _result;
  String butText = '增加';

  _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(USERNAME, username);

    prefs.setString(PWD, pwd);

    setState(() {
      butText = '增加成功';
      _result = '_add 成功 请点击查验证结果';
    });
  }

  _delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //KEY
    prefs.remove(USERNAME);
    prefs.remove(PWD);

    //清空所有KEY
    //prefs.clear();

    setState(() {
      _result = '_delete 成功, 请点击查验证结果';
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(USERNAME, 'Paul');

    prefs.setString(PWD, '654321');

    setState(() {
      _result = '_update 成功，用户名修改为Paul，密码修改为654321, 请点击查验证结果';
    });
  }

  _query() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String username = prefs.get(USERNAME);

    String pwd = prefs.get(PWD);

    print('$username');

    print('$pwd');

    setState(() {
      _result = '_query 成功: username: $username pwd: $pwd';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('shared_preferences用法'),
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black,
                child: new Text(butText),
                onPressed: _add),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('删'),
                onPressed: _delete),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('改'),
                onPressed: _update),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查'),
                onPressed: _query),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('结果：$_result'),
        ),
      ],
    );
  }
}

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var node = new FocusNode();
    return new Column(
      children: <Widget>[
        new TextField(
          onChanged: (str) {
            username = str;
            print(username);
          },
          decoration: new InputDecoration(
            labelText: '用户名',
            hintText: '请输入英文或数字',
          ),
          maxLines: 1,
          onSubmitted: (text) {
            //FocusScope.of(context).reparentIfNeeded(node);
          },
        ),
        new TextField(
          onChanged: (text) {
            pwd = text;
            print(pwd);
          },
          obscureText: true,
          maxLines: 1,
          decoration:
              new InputDecoration(hintText: '请输入长度大于6的密码', labelText: '密码'),
          keyboardType: TextInputType.text,
          onSubmitted: (text) {},
        ),
      ],
    );
  }
}
