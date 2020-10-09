import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_demo/buttons/custom_button.dart';
import 'package:widget_demo/buttons/reisedbutton.dart';

import 'cupertinobutton.dart';
import 'flatbutton.dart';
import '../listviews/listview_use_page13.dart';
import 'floatingactionbutton.dart';
import 'outlinebutton.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button 基本用法"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReisedButtons()));
              },
              child: Text("凸起按钮 RaisedButton"),
              color: Colors.lime,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Flatbutton()));
            },
            child: Text("扁平化按钮 FlatButton"),
            color: Colors.orange,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Outlinebutton()));
                    },
                    child: Text("线框按钮 OutlineButton"),
                    color: Colors.black, // 无效
                    textColor: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Text(
                "ios风格按钮 CupertinoButton",
                style: TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cupertinobutton()));
              },
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(Radius.circular(22)),
            ),
          ),
          MyStatefulWidget(),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewUsePage13()));
                },
                child: Text(
                  "listview优化",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  "标签2",
                  style: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              MyCustomButton(
                pressed: () {},
                text: "自定义按钮",
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FloatingactionButton()));
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  "标签4",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem(
                value: WhyFarther.harder,
                child: Text('第一行哈哈哈'),
              ),
              const PopupMenuItem(
                value: WhyFarther.smarter,
                child: Text(
                  '第二行哈哈哈',
                ),
              ),
            ],
            icon: Icon(Icons.pan_tool),
            elevation: 10,
            offset: Offset(-50.0, 50.0),
            tooltip: "this is a PopupMenuButton", //为什么不显示了呢
          ),
        ],
      ),
    );
  }
}

double _volume = 0.0;

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10', // 鼠标移上去为什么不显示
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume')
      ],
    );
  }
}

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

// This menu button widget updates a _selection field (of type WhyFarther,
// not shown here).
