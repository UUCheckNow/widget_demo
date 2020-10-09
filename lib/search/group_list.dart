import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/sources/list_item.dart';

class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(7, (index) {
      if (index == 0) {
        return HeadingItem("汇友");
      } else if (index > 0 && index < 3) {
        return MessageItem("玛格丽特", "昵称：娃哈哈");
      } else if (index == 3) {
        return HeadingItem("群");
      } else {
        return MessageItem("flutter学习交流群", "公告：付费入群，文明交流");
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("分组列表"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: item.buildTitle(context),
            );
          }),
    );
  }
}
