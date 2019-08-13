import 'package:flutter/material.dart';
import 'package:flutter_module/common/progreess_dialog.dart';
import 'package:scoped_model/scoped_model.dart';

import 'list_mode.dart';

//创建第一个列表 类似ListView
class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
//    ListModel model = ScopedModel.of<ListModel>(context); // 获取ListModel
//    model.loadList(); // 加载列表
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ListModel>(
        builder: (context, child, model) {
      var list = model.list;
      print('-------li--${list.length}');
      if (!model.isInit) {
        return loading();
      }else{
        return Container(
          child: ListView.builder(
            shrinkWrap: true,
            //physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index]),
                onTap: () {
                  ListModel model = ScopedModel.of<ListModel>(context);
                  model.select(list[index]);
                  // 返回到上一级页面
                  // Navigator.pop(context);
                },
              );
            },
          ),
        );
      }

    });
  }
}
