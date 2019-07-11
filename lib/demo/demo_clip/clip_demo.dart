import 'package:flutter/material.dart';

class ClipStudyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ClipStudyState();
  }
}

class ClipStudyState extends State<ClipStudyDemo> {
  List<String> _tags = [
    'Orange',
    'Pitaya',
    'Grape',
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  String _choice="Lemon";
  List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Clip标签'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.all(16),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Wrap(
                spacing: 1, ////主轴方向上的间距
                runSpacing: 1, //run的间距。
                children: <Widget>[
                  Chip(
                    label: Text('Life'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Sunset'),
                    backgroundColor: Colors.red,
                    avatar: CircleAvatar(
                      // backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'http://img3.3lian.com/2013/c4/95/d/18.jpg'),
                      child: Text('伟'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                  Chip(
                    label: Text('Life'),
                  ),
                ],
              ),
              new Divider(
                color: Colors.grey,
                height: 32.0,
                //indent: 32.0,
              ),
              Chip(
                label: Text('长按弹出文字'),
                onDeleted: () {},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.redAccent,
                deleteButtonTooltipMessage: 'Remove this tag',
              ),
              new Text("列表数据"),
              new Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _tags.map((tag) {
                  return new Chip(
                    label: Text(tag),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(tag);
                      });
                    },
                  );
                }).toList(),
              ),
              Divider(
                color: Colors.grey,
                height: 32.0,
                // indent: 32.0,
              ),
              new Container(
                width: double.infinity,
                child: Text(
                  'ActionChip: $_action',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              new Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _tags.map((tag) {
                  return new ActionChip(
                    label: Text(tag),
                    onPressed: () {
                      setState(() {
                        _action = tag;
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'FilterChip: ${_selected.toString()}',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              new Wrap(
                spacing: 2,
                runSpacing: 2,
                children: _tags.map((tag) {
                  return new FilterChip(
                    label: Text(tag),
                    selected: _selected.contains(tag),
                    selectedColor:  Colors.orange,
                    onSelected: (value) {
                      setState(() {
                        if (_selected.contains(tag)) {
                          _selected.remove(tag);
                        } else {
                          _selected.add(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'ChoiceChip: ${_selected.toString()}',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              new Wrap(
                spacing: 2,
                runSpacing: 2,
                children: _tags.map((tag) {
                  return new ChoiceChip(
                    label: Text(tag),
                    selectedColor: Colors.orange,
                    selected: _choice == tag,
                    onSelected: (value) {
                      setState(() {
                        _choice = tag;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tags = [
              'Orange',
              'Pitaya',
              'Grape',
              'Apple',
              'Banana',
              'Lemon',
            ];
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
