import 'package:flutter/material.dart';

class ListViewChange extends StatefulWidget {
  @override
  _ListViewChangeState createState() => _ListViewChangeState();
}

class _ListViewChangeState extends State<ListViewChange> {
  bool isOpen = false;
  List listData = [
    "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg",
    "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg",
    "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可展开列表"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.yellow,
              size: 60,
            ),
            title: Text(
              "title" * 5,
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "内容" * 30,
                  maxLines: this.isOpen ? null : 1,
                  style: TextStyle(fontSize: 14),
                ),
                this.isOpen
                    ? Wrap(
                        children: [
                          Image.network(listData[0],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[1],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[2],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[0],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[1],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[2],
                              width: 100, height: 100, fit: BoxFit.cover),
                          Image.network(listData[2],
                              width: 100, height: 100, fit: BoxFit.cover),
                        ],
                      )
                    : Container(),
                this.isOpen
                    ? Text(
                        "深圳" + "2020.09.26" + "回复",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    : Container(),
              ],
            ),
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.yellow,
              size: 60,
            ),
            title: Text(
              "title" * 5,
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Text(
              "subtitle" * 2,
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              setState(() {});
            },
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.yellow,
              size: 60,
            ),
            title: Text(
              "title" * 5,
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Text(
              "subtitle" * 2,
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
