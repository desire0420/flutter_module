import 'package:flutter/material.dart';
import 'package:flutter_module/Fwidget/button/linear_gradient_button_widget.dart';
import 'package:flutter_module/Fwidget/button/loading_button.dart';
import 'package:flutter_module/Fwidget/button/raised_button_widger.dart';
import 'package:flutter_module/Fwidget/fl_toast.dart';

class ButtonStudyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ButtonStudyState();
  }
}

class ButtonStudyState extends State<ButtonStudyDemo> {
  bool _indiOnlyLoading = false;

  @override
  Widget build(BuildContext context) {
    //文本按钮
    Widget flatButtonDemo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('文本btn'),
            onPressed: () {},
            splashColor: Colors.yellow, //水波纹颜色
            textColor: Colors.pink,
          ),
          FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
          ),
        ],
      );
    }

    Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              /* shape: BeveledRectangleBorder(
                 borderRadius: BorderRadius.circular(5.0),
               ),*/
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.yellow,
            elevation: 0.0,
          ),
        ),
        SizedBox(width: 16.0),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.red[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            // color: Theme.of(context).accentColor,
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    //固定宽度的按钮
    Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    //Expanded组件可以使 Row、Column、Flex等子组件在其主轴方向上展开并填充可用空间
    Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: OutlineButton(
            child: Text('Button1'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('ButtonDemo'),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new FLLinearGradientButton(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFC163), Color(0xFFFF51BD)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    btnTxt: '11提交我们的约定',
                    onPressed: () {
                      FLToast.show("11", context);
                    }),
                SizedBox(height: 16.0),
                new FLRaisedButton(
                    btnTxt: '提交我们的约定',
                    onPressed: () {
                      FLToast.show("11", context);
                    }),
                SizedBox(height: 16.0),
                new FLLoadingButton(
                  child: Text('Button'),
                  loading: _indiOnlyLoading,
                  onPressed: () {
                    setState(() => _indiOnlyLoading = true);
                    Future.delayed(
                        Duration(seconds: 3), () => setState(() => _indiOnlyLoading = false));
                  },
                ),
                SizedBox(height: 16.0),
                OutlineButton(
                    color: Color(0xFF239EF5),
                    textColor: Color(0xFF7F57DB),
                    child: Text('Success Toast', style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      FLToast.show("This issi", context,
                          backgroundColor: Color(0xFFE22F9C), type: FLToastType.success);
                    }),
                SizedBox(height: 16.0),
                FLRaisedButton(
                    bgColor: Color(0xFFFFCE43),
                    textColor: Color(0xFFFFFFFF),
                    margin: EdgeInsets.all(1),
                    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    btnTxt: "收下",
                    //不设置则不可点击
                    onPressed: null),
                flatButtonDemo(),
                raisedButtonDemo,
                outlineButtonDemo,
                fixedWidthButton,
                expandedButton,
                floatingActionButton(),
                PopupMenuButtonDemo(),
                buttonBarDemo(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    OutlineButton(
                      child: Text('Button'),
                      onPressed: () {},
                      splashColor: Colors.grey[100],
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                    ),
                    OutlineButton(
                      child: Text('Button'),
                      onPressed: () {},
                      splashColor: Colors.grey[100],
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class buttonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          //ButtonBar 可以默认实现一个按钮组，通过 children 属性可以传入多个 Button
          //而 ButtonBar 内部其实也是基于 Row 实现的
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//悬浮按钮
class floatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //另外：Flutter还提供另一个扩展的FloatActionButton.extended   可以实现改shape  加img
    //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //设置FloatingActionButton位置
    return new FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      tooltip: '长按之后提示的文字',
      //长按提示的文字
      foregroundColor: Colors.black,
      //设置显示图标或者文本的颜色//前提是子child没有设置
      backgroundColor: Colors.pink,
      //设置按钮的背景色
//          heroTag: ,//类似于一个标识
      highlightElevation: 1.0,
      shape: const CircleBorder(),
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}

//弹框pop 按钮
class PopupMenuButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PopupMenuButtonDemoState();
  }
}

class PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentMenuItem),
              PopupMenuButton(
                onSelected: (value) {
                  print(value);
                  setState(() {
                    currentMenuItem = value;
                  });
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Home',
                    child: Text('Home'),
                  ),
                  PopupMenuItem(
                    value: 'Discover',
                    child: Text('Discover'),
                  ),
                  PopupMenuItem(
                    value: 'Community',
                    child: Text('Community'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
