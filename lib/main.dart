import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';
import 'package:widget_demo/app_analysis.dart';
import 'package:widget_demo/router.dart';
import 'package:widget_demo/software_application.dart';

void main() {
//   debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: new MyApp(),
  ));
  SoftwareApplication.getInstance().onCreate(); // 接入 友盟统计

  FlutterError.onError = (FlutterErrorDetails details) {
    print("dsdfsdfafaef$details");
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      navigatorObservers: [AppAnalysis()],
      initialRoute: '/',
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              UmengAnalyticsPlugin.event('clickSearch');
              Navigator.of(context).pushNamed("/searchPage");
            },
          )
        ],
      ),
      body: ListView(
        children: [
          buildButton(context,
              text: 'Dio实例', navigationName: RouteNames.DIOPAGE),
          buildButton(context,
              text: '计时器示例', navigationName: RouteNames.STREAMBUILDROUTE),
          buildButton(context,
              text: '模拟异步数据请求', navigationName: RouteNames.FUTUREBUILDROUTE),
          buildButton(context,
              text: '主题测试', navigationName: RouteNames.THEMETESTROUTE),
          buildButton(context,
              text: '购物车', navigationName: RouteNames.PROVIDERROUTE),
          buildButton(context,
              text: 'popupmenubutton使用',
              navigationName: RouteNames.BASICAPPBARSAMPLE),
          buildButton(context,
              text: '分组列表（搜索结果UI展示）',
              navigationName: RouteNames.SEARCHRESULTLIST),
          buildButton(context,
              text: 'Buttons', navigationName: RouteNames.BUTTONS),
          buildButton(context,
              text: 'ReisedButton', navigationName: RouteNames.REISEDBUTTONS),
          buildButton(context,
              text: 'ListViews使用', navigationName: RouteNames.LISTVIEWS),
          buildButton(context,
              text: 'GridViews使用', navigationName: RouteNames.GRIDVIEWS),
          buildButton(context,
              text: '可展开列表', navigationName: RouteNames.LISTVIEWCHANGE),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context,
      {@required String text, @required String navigationName}) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(navigationName);
        },
        child: Text(text),
      ),
    );
  }
}
