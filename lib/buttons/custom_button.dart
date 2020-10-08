import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final text;
  final fontColor;
  final pressed;
  final width;
  final height;
  const MyCustomButton(
      {this.text = "自定义按钮",
      this.fontColor = Colors.pink,
      this.pressed = null,
      this.width = 80.0,
      this.height = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: RaisedButton(
        color: this.fontColor,
        onPressed: this.pressed,
        child: Text(
          this.text,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
