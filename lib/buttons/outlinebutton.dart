import 'package:flutter/material.dart';

class Outlinebutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OutlineButton"),
      ),
      body: Center(
        child: OutlineButton.icon(
          onPressed: () {},
          label: Text("线框按钮"),
          color: Colors.brown,
          textColor: Colors.redAccent,
          icon: Icon(Icons.timeline),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.purple, width: 2),
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(20))),
        ),
      ),
    );
  }
}
