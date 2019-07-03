import 'package:flutter/material.dart';
import 'package:flutter_module/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DataTableState();
  }
}

class DataTableState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("DataTable"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new ListView(
          children: <Widget>[
            DataTable(
               sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              //表格头部
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;

                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }

                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
              ],
              //表格行
              rows: posts.map((post) {
                return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value) {
                      setState(() {
                        if (post.selected != value) {
                          post.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(post.title)),
                      DataCell(Text(post.author)),
                    ]);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
