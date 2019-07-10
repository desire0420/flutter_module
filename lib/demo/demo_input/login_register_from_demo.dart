import 'package:flutter/material.dart';

class InputDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("我"),
        centerTitle: true,
        elevation: 0.0,//底部阴影
      ),
      body: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
          ),
          child: new Container(
            padding: EdgeInsets.all(20),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new LoginStateDemo(),
              ],
            ),
          )),
    );
  }
}

class LoginStateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // return new TextFileDemoState();
    return new FormAutoDemo();
  }
}

//自动验证
class FormAutoDemo extends State<LoginStateDemo> {
  final regiestFormKey = GlobalKey<FormState>(); //得到表单里面的数据
  String name;
  String psd;
  bool validatorData = false;

  void submit() {
    //避免一开始进入页面就自动验证表单
    if (regiestFormKey.currentState.validate()) {
      //如果验证通过，保存表单里面填写的数据
      regiestFormKey.currentState.save();
      debugPrint('name: $name');
      debugPrint('psd: $psd');
    //验证通过后  弹框提示
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("success")));
    } else {
      setState(() {
        validatorData = true;
      });
    }
  }

  String validatorName(value) {
    if (value.isEmpty) {
      return '姓名不能为空';
    }
    return null;
  }

  String validatorPsd(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: regiestFormKey,
        child: new Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'UserName',
                helperText: '',
              ),
              onSaved: (value) {
                //value 表单里面输入的数据
                name = value;
              },
              //  autovalidate: true,//自动验证
              autovalidate: validatorData,
              validator: validatorName, //验证表单输入的数据
            ),
            TextFormField(
              obscureText: true,
              //密码隐藏*
              decoration: InputDecoration(
                labelText: 'PassWord',
                helperText: '',
              ),
              onSaved: (value) {
                //value 表单里面输入的数据
                psd = value;
              },
              validator: validatorPsd,
              autovalidate: validatorData, //验证表单
            ),
            SizedBox(height: 10),
            new Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: new RaisedButton(
                color: Theme.of(context).buttonColor,
                onPressed: submit,
                elevation: 0.0,
                child: Text(
                  "提交",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ));
  }
}

//输入框监听  输入
class TextFileDemoState extends State<LoginStateDemo> {
  //监听文本字段的变化
  final textEditingController = new TextEditingController();

  //销毁的时候调用
  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose(); //监听器用完需要销毁
    super.dispose();
  }

  //创建的时候调用
  @override
  void initState() {
    // TODO: implement initState  初始数据
    //  textEditingController.text="wangwei";
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TextField(
      //监听输入框输入
//      onChanged: (value) {
//        debugPrint(value);
//      },
      controller: textEditingController,
      //输入框确定事件
      onSubmitted: (value) {
        //debugPrint('sum' + value);
      },
      decoration: InputDecoration(
          icon: Icon(Icons.ac_unit),
          labelText: "Title",
          hintText: "hint",
          //去除输入框西面默认黑色线
          border: InputBorder.none,
          filled: true //灰色背景
          // border:OutlineInputBorder()//边框

          ),
    );
  }
}
