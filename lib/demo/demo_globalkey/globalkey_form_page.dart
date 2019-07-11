import 'package:flutter/material.dart';

class SwitcherWidget extends StatefulWidget {
  SwitcherWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwitcherWidgetState();
  }
}

class SwitcherWidgetState extends State<SwitcherWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
            value: isActive,
            activeColor: Colors.blueAccent,
            onChanged: (bool currentStatus) {
              isActive = currentStatus;
              setState(() {});
            }),
      ),
    );
  }

  void changeState() {
    isActive = !isActive;
    setState(() {});
  }
}

//如上所示，开关控件是一个单独的控件，如果我们要想在外部该变改控件的状态，我们就需要使用GlobalKey。

class SwitcherWidgetChange extends StatefulWidget {
  SwitcherWidgetChange({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SwitcherWidgetChangeState();
  }
}

class SwitcherWidgetChangeState extends State<SwitcherWidgetChange> {
  //定义了一个GlobalKey并传递给SwitcherWidget，
  final GlobalKey<SwitcherWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitcherWidget(key: key),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 通过这个key拿到它所绑定的SwitcherWidgetState在外部调用SwitcherWidgetState的changeState
          key.currentState.changeState();
        },
        child: Text('切换'),
      ),
    );
  }
}

/**在上面代码中我们通过定义了一个GlobalKey并传递给SwitcherWidget，
 * 然后我们便可以通过这个key拿到它所绑定的SwitcherWidgetState
 * 并在外部调用SwitcherWidgetState的changeState方法改变状态了。*/
/*--------------------------*/
class GlobalKeyFromPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GlobalKeyFromPageState();
  }
}

class GlobalKeyFromPageState extends State<GlobalKeyFromPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("GlobalKey"),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new FormOnePage(scaffoldKey),
        ],
      ),
    );
  }
}
/*------------------------------*/

class FormOnePage extends StatefulWidget {
  final _key;

  FormOnePage(this._key);

  @override
  State<StatefulWidget> createState() {
    return new FormOnePageState();
  }
}

class FormOnePageState extends State<FormOnePage> {
  final formKey = GlobalKey<FormState>();

  String _phoneNum;

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  decoration: new InputDecoration(
                    hintText: '请输入手机号',
                  ),
                  maxLines: 1,
                  maxLength: 11,
                  //键盘展示为号码
                  keyboardType: TextInputType.phone,
                  validator: (str) {
                    return str.isEmpty ? "手机号不能为空" : null;
                  },
                  onSaved: (str) {
                    _phoneNum = str;
                  },
                ),
                RaisedButton(
                  child: Text("提交"),
                  onPressed: onPressed,
                ),
              ],
            )));
  }

  void onPressed() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      var snackBar = SnackBar(content: Text('phone: $_phoneNum'));
      widget._key.currentState.showSnackBar(snackBar);
    }
  }
}
