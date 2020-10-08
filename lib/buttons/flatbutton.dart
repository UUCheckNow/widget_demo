import 'package:flutter/material.dart';

class Flatbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flatbutton"),
      ),
      body: Center(
        child: FlatButton.icon(
          onPressed: () {},
          label: Text("扁平化按钮"),
          color: Colors.brown,
          textColor: Colors.redAccent,
          icon: Icon(Icons.assistant_photo),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
