import 'package:flutter/material.dart';

class ListViewDetail extends StatelessWidget {
  String imageStr;
  ListViewDetail({this.imageStr});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDetail"),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.network(this.imageStr),
            Text(
              "这是❤️文章详情✨哇，卡吗？" * 100,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      )),
    );
  }
}
