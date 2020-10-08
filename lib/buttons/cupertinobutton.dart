import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertinobutton extends StatefulWidget {
  @override
  _CupertinobuttonState createState() => _CupertinobuttonState();
}

class _CupertinobuttonState extends State<Cupertinobutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoButton"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              // 带蓝色背景按钮
              onPressed: () {},
              child: Text("CupertinoButton.filled默认扁平化按钮"),
            ),
            SizedBox(
              height: 5,
            ),
            CupertinoButton(
              // 默认不带背景色按钮
              child: Icon(
                Icons.access_alarm,
              ),
              onPressed: () {},
              color: Colors.redAccent, // 设置背景色
              minSize: 66.0, // defaule is 44.0
            ),
            CupertinoButton(
                child: Text(
                    "CupertinoButton按钮默认样式CupertinoButton按钮默认样式CupertinoButton按钮默认样式CupertinoButton按钮默认样式CupertinoButton按钮默认样式"),
                onPressed: () {})
          ],
        ),
      ),
    );
    ;
  }
}
