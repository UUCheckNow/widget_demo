import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'gradient_button.dart';

/*Material Design中的button， 一个凸起的材质矩形按钮*/
class ReisedButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 脚手架
      appBar: AppBar(
        title: Text("ReisedButtons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 沿主轴居中
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("普通按钮"),
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  onPressed: null,
                  child: Text("禁用按钮"),
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  onPressed: () {
                    print("点击带属性浮动按钮");
                  },
                  child: Text("带属性按钮"),
                  textColor: Colors.white,
                  color: Colors.deepOrangeAccent,
                  highlightColor: Colors.lightGreen,
                  splashColor: Colors.deepPurpleAccent,
                  // 点击时水波纹颜色
                  elevation: 10,
                  // 阴影范围，（一般不会设置太大）
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  padding: EdgeInsets.all(10),
                  // padding: EdgeInsets.only(top: 10),
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("shape属性"),
                  textColor: Colors.white,
                  color: Colors.lime,

                  // shape: BeveledRectangleBorder(
                  //     side: BorderSide(
                  //       color: Colors.black,
                  //       width: 1.0,
                  //     ),
                  //     borderRadius: BorderRadius.all(Radius.circular(8))),

                  // shape: CircleBorder(
                  //   side: BorderSide(color: Colors.pinkAccent, width: 1),
                  // ),

                  // shape: StadiumBorder(),

                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple, width: 2),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                ContainerButton(),
                SizedBox(
                  width: 5,
                ),
                GradientButton(
                  child: Text('波纹&阴影'),
                  height: 40,
                  width: 130,
                  colors: [Colors.indigo, Colors.blue],
                  onPressed: () {},
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                SizedBox(
                  width: 5,
                ),
                ContainerShadowButton()
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: null,
                  child: Text("通过SizedBox自适应"),
                  disabledColor: Colors.lime,
                  disabledTextColor: Colors.white,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Container(
                height: 40,
                // width: 100, // 无效
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("通过ConstrainedBox自适应"),
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 300,
              height: 30,
              child: Expanded(
                child: RaisedButton.icon(
                  textColor: Colors.blue, // 图标会和文字颜色一起变化
                  onPressed: () {},
                  icon: Icon(Icons.ac_unit),
                  label: Text("图标按钮"),
                  color: Colors.limeAccent,
                ),
              ),
            ),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('AH')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('ML')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('HM')),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('JL')),
                  label: Text('Laurens'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
