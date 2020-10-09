import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/sources/list_item.dart';

class SearchResultDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(100, (index) {
      return MessageItem("玛格丽特", "昵称：Believe in yourself.Believe in yourself.");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("全部结果"),
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
