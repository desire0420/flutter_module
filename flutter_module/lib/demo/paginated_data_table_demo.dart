import 'package:flutter/material.dart';
import 'package:flutter_module/model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PaginatedDataTableState();
  }
}

class PaginatedDataTableState extends State<PaginatedDataTableDemo> {

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("PaginatedDataTableDemo"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new ListView(
          children: <Widget>[
            new PaginatedDataTable(
                header: Text("Post"),
                columns: [
                  DataColumn(
                    label: Text('Title'),
                  ),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  ),
                ],
                source: _postsDataSource)
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }
}
