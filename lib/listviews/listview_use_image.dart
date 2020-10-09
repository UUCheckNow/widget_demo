import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/listviews/listView_detail.dart';
import 'package:widget_demo/sources/listdata.dart';

import 'listView_detail.dart';

class ListViews extends StatelessWidget {
  // 自定义方法，返回数据
  List<Widget> _getData() {
    // var tempList = listData.map((e) { // 读取listData中的数据
    //   return ListTile(
    //     leading: Image.network(e["imageUrl"]),
    //     title: Text(e["title"]),
    //     subtitle: Text(e["author"]),
    //   );
    // });
    //
    // return tempList.toList();

    List<Widget> list = List(); // 这里要指定<widget> 自己构造数据
    for (var i = 0; i < 30; i++) {
      list.add(ListTile(
        leading: Image.network(
            "https://c-ssl.duitang.com/uploads/item/201807/05/20180705112414_4SsXE.jpeg"),
        title: Text("这是列表$i"),
        subtitle: Text("$i髅髅宫歌留多《妖狐×仆SS》"),
        trailing: Image.network(
            "https://c-ssl.duitang.com/uploads/item/202007/15/20200715131823_vdeMe.gif"),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // return ListView( // 方案一：固定数据
    //   children: _getData(),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("listview使用"),
      ),
      body: ListView.builder(
        // 方案二：从listData中动态获取
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(listData[index]["imageUrl"]),
            title: Text(listData[index]["title"]),
            subtitle: Text(listData[index]["author"]),
            trailing: Image.network(
                "https://c-ssl.duitang.com/uploads/item/202007/15/20200715131823_vdeMe.gif"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListViewDetail(
                            imageStr: listData[index]["imageUrl"],
                          )));
            },
          );
        },
      ),
    );
  }
}
