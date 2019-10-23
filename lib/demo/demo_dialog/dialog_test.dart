import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_study_demo.dart';

class DialogTest extends StatelessWidget {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('SimpleDialog'),
                  onPressed: () {
                    _showSimpleDialog(context);
                  },
                ),
                RaisedButton(
                  child: Text('AlertDialog'),
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                ),
                RaisedButton(
                  child: Text('CupertinoAlertDialog'),
                  onPressed: () {
                    _showCupertinoAlertDialog(context);
                  },
                ),
                RaisedButton(
                  child: Text('CustomDialog'),
                  onPressed: () {
                    _showCustomDialog(context);
                  },
                ),
                RaisedButton(
                  child: Text('bottomSheet'),
                  onPressed: () {
                    _showBottomView(context);
                  },
                ),
                RaisedButton(
                  child: Text('bottomSelectSheet'),
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                ),
              ],
            ),
          );
        }));
  }

  void _showBottomView(BuildContext context) {
    var datas = List.generate(20, (index) {
      return 'datas$index';
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('确定'),
                    splashColor: Colors.grey,
                    highlightColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      print('selectedIndex:$selectedIndex' + 'data:${datas[selectedIndex]}');
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  children: datas.map((item) {
                    return Text(item);
                  }).toList(),
                  onSelectedItemChanged: (index) {
                    print('$index');
                    selectedIndex = index;
                  },
                  itemExtent: 36,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) {
        return SimpleDialog(
          // title: Text('SimpleDialog',textAlign: TextAlign.center,),
          // titlePadding: EdgeInsets.all(10),
          backgroundColor: Colors.amber,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                'assets/123.jpg',
                fit: BoxFit.cover,
                // height: 400,
                // width: 400,
              ),
              onTap: () {
                //先关闭弹窗
                Navigator.pop(context);

              },
            )
            // ListTile(
            //   title: Center(
            //     child: Text("Item_1"),
            //   ),
            // ),
            // ListTile(
            //   title: Center(
            //     child: Text("Item_2"),
            //   ),
            // ),
            // ListTile(
            //   title: Center(
            //     child: Text("Item_3"),
            //   ),
            // ),
            // ListTile(
            //   title: Center(
            //     child: Text("Close"),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            'data',
            textAlign: TextAlign.center,
          ),
          content: Text('datadatadatadatadatasdadadatadatadatadatadatadatadatadatadatadatadatadata'),
          elevation: 5,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('确定'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: Text(
            'data',
            textAlign: TextAlign.center,
          ),
          content: Text('datadatadatadatadatasdadadatadatadatadatadatadatadatadatadatadatadatadata'),
          // elevation: 5,
          actions: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
              //   ),
              // ],
            )
          ],
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return CustomDialog();
      },
    );
  }

  void _showSelectionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return Container(
          color: Colors.grey,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: _itemCreat(context, '相机'),
                onTap: () {
                  print('选中相机');
                },
              ),
              GestureDetector(
                child: _itemCreat(context, '相册'),
                onTap: () {
                  print('选中相册');
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: _itemCreat(context, '取消'),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget _itemCreat(BuildContext context, String title) {
    return Container(
      color: Colors.white,
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomDialog extends Dialog {
  CustomDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        height: 365,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/123.jpg',
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('确定'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
