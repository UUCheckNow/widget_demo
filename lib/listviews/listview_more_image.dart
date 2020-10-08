import 'package:flutter/material.dart';

class ListViewMoreImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  Container buildContent() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            color: Colors.yellow,
            child: Row(
              children: [
                Container(
                  color: Colors.cyan,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: Image.network(
                    "https://c-ssl.duitang.com/uploads/item/201308/17/20130817195806_QrfUm.jpeg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "用户昵称",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      "回复内容",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    Text(
                      "时间+地点+回复",
                      style: TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
