import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CheckBoxLearn();
  }
}

class CheckBoxLearn extends State<CheckboxDemo> {
  bool checkboxItemA = true; //复选框
  int _radioGroupA = 0; //单选按钮
  bool _switchItemA = false; //滑動选择器
  double _sliderItemA = 0.0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  //折叠布局   数据
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    // 初始化折叠布局数据
    _expansionPanelItems = [
      ExpansionPanelItem(
          headerText: 'PanelA',
          body: new Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text('Content for Panel A.')),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: 'PanelB',
          body: new Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text('Content for Panel B.')),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: 'PanelC',
          body: new Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: new Column(
              children: <Widget>[
                Text('Content for Panel C1.'),
                Text('Content for Panel C2.'),
                Text('Content for Panel C3.')
              ],
            ),
          ),
          isExpanded: false),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("widgets"),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              //折叠布局，点击展开  收起
              new ExpansionPanelList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                    });
                  },
                  children: _expansionPanelItems.map((ExpansionPanelItem item) {
                    return ExpansionPanel(
                      isExpanded: item.isExpanded,
                      body: item.body,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headerText,
                            style: Theme.of(context).textTheme.title,
                          ),
                        );
                      },
                    );
                  }).toList()),
              //复选框
              new Column(
                children: <Widget>[
                  //CheckboxListTile 是一个 Checkbox 的上层封装
                  CheckboxListTile(
                    value: checkboxItemA,
                    onChanged: (value) {
                      setState(() {
                        checkboxItemA = value;
                      });
                    },
                    title: Text('Checkbox Item A'),
                    subtitle: Text('Description'),
                    selected: checkboxItemA,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: checkboxItemA,
                        onChanged: (value) {
                          setState(() {
                            checkboxItemA = value;
                          });
                        },
                        activeColor: Colors.pink, //激活时的颜色
                      ),
                    ],
                  ),
                ],
              ),
              //单选按钮
              new Column(
                children: <Widget>[
                  Text('单选按钮RadioGroupValue: $_radioGroupA'),
                  RadioListTile(
                    value: 0,
                    groupValue: _radioGroupA,
                    onChanged: _handleRadioValueChanged,
                    title: Text('Options A'),
                    subtitle: Text('Description'),
                    secondary: Icon(Icons.filter_1),
                    selected: _radioGroupA == 0,
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: _radioGroupA,
                    onChanged: _handleRadioValueChanged,
                    title: Text('Options B'),
                    subtitle: Text('Description'),
                    secondary: Icon(Icons.filter_2),
                    selected: _radioGroupA == 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: _radioGroupA,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.pink,
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioGroupA,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.pink,
                      ),
                    ],
                  ),
                ],
              ),
              //滑动选择
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SwitchListTile(
                    value: _switchItemA,
                    onChanged: (value) {
                      setState(() {
                        _switchItemA = value;
                      });
                    },
                    title: Text('滑动选择器'),
                    subtitle: Text('Description'),
                    secondary: Icon(
                        _switchItemA ? Icons.visibility : Icons.visibility_off),
                    selected: _switchItemA,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _switchItemA ? '打开' : '关闭',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Switch(
                        value: _switchItemA,
                        onChanged: (value) {
                          setState(() {
                            _switchItemA = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              //滑竿数值
              new Column(
                children: <Widget>[
                  Slider(
                    value: _sliderItemA,
                    onChanged: (value) {
                      setState(() {
                        _sliderItemA = value;
                      });
                    },
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor:
                        Theme.of(context).accentColor.withOpacity(0.3),
                    min: 0.0,
                    max: 10.0,
                    divisions: 10,
                    label: '${_sliderItemA.toInt()}',
                  ),
                  Text('SliderValue: $_sliderItemA'),
                ],
              ),
              //时间选择
              SizedBox(
                height: 20,
              ),
              new Text("时间选择"),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: _selectDate,
                    child: Row(
                      children: <Widget>[
                        Text(DateFormat.yMMMMd().format(selectedDate)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _selectTime,
                    child: Row(
                      children: <Widget>[
                        Text(selectedTime.format(context)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//折叠布局数据产生
class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}
