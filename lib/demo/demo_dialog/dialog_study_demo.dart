import 'package:flutter/material.dart';

import 'dialog_test.dart';

enum Action { Ok, Cancel }

enum Option { A, B, C }

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

class DialogStudyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DialogStudyState();
  }
}

class DialogStudyState extends State<DialogStudyDemo> {
  _onPresse2() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('这是一个弹窗'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('确定'))
      ]),
    );
  }

  String _choice = 'Nothing';

  Future openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context, Action.Ok);
              },
            ),
          ],
        );
      },
    );
    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }

  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
      default:
    }
  }

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text('01:30 / 03:30'),
              Expanded(
                child: Text(
                  'Fix you - Coldplay',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future _openModalBottomSheet() async {
    mostCare.forEach((k, v) {
      print(k + "==" + v.toString()); //类型不一样的时候就toString()
    });

    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });

    print(option);
  }

  @override
  Widget build(BuildContext context) {
    var d = '11';
    print('======${d.runtimeType}');
    return new Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('Dialog'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Your choice 1'),
              Text('Your choice 2'),
              Text('Your choice 3'),
            ],
          ),
          SizedBox(
            height: 36.0,
          ),
          Text('Your choice is: $_choice'),
          RaisedButton(
            child: Text('Open AlertDialog'),
            onPressed: openAlertDialog,
          ),
          FlatButton(
            child: Text('Open BottomSheet'),
            onPressed: _openBottomSheet,
          ),
          FlatButton(
            child: Text('Modal BottomSheet'),
            onPressed: _openModalBottomSheet,
          ),
          FlatButton(
            child: Text('DialogTest'),
            onPressed: () {
              //跳转到下一页
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DialogTest()),
              );
            },
          ),
          SnackBarButton()
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Processing...'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
        // Scaffold.of(context).showSnackBar(SnackBar(content: Text("success")));
      },
    );
  }
}
