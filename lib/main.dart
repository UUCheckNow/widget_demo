import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/dart/provider_route.dart';
import 'package:widget_demo/search/group_list.dart';
import 'package:widget_demo/search/search_page.dart';
import 'package:widget_demo/theme/theme_test_route.dart';

import 'async_refresh_ui/future_builder.dart';
import 'async_refresh_ui/stream_builder.dart';
import 'buttons/buttons.dart';
import 'buttons/popupmenubutton.dart';
import 'buttons/reisedbutton.dart';
import 'dio/dio_page.dart';
import 'gridviews/gridview_goods.dart';
import 'listviews/listview_change.dart';
import 'listviews/listview_use_image.dart';

void main() {
//   debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainPage(),
        '/dioPage': (BuildContext context) => DioPage(),
        '/futureBuilderRoute': (BuildContext context) => FutureBuilderRoute(),
        '/streamBuilderRoute': (BuildContext context) => StreamBuilderRoute(),
        '/themeTestRoute': (BuildContext context) => ThemeTestRoute(),
        '/basicAppBarSample': (BuildContext context) => BasicAppBarSample(),
        '/searchResultList': (BuildContext context) => SearchResultList(),
        '/buttons': (BuildContext context) => Buttons(),
        '/reisedButtons': (BuildContext context) => ReisedButtons(),
        '/listViews': (BuildContext context) => ListViews(),
        '/gridViews': (BuildContext context) => GridViews(),
        '/listViewChange': (BuildContext context) => ListViewChange(),
        '/providerRoute': (BuildContext context) => ProviderRoute(),
        '/searchPage': (BuildContext context) => SearchPage(
              hideLeft: true,
            ),
      },
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
              Navigator.of(context).pushNamed("/searchPage");
            },
          )
        ],
      ),
      body: ListView(
        children: [
          buildButton(context, text: 'Dio实例', navigationName: '/dioPage'),
          buildButton(context,
              text: '计时器示例', navigationName: '/streamBuilderRoute'),
          buildButton(context,
              text: '模拟异步数据请求', navigationName: '/futureBuilderRoute'),
          buildButton(context, text: '主题测试', navigationName: '/themeTestRoute'),
          buildButton(context, text: '购物车', navigationName: '/providerRoute'),
          buildButton(context,
              text: 'popupmenubutton使用', navigationName: '/basicAppBarSample'),
          buildButton(context,
              text: '分组列表（搜索结果UI展示）', navigationName: '/searchResultList'),
          buildButton(context, text: 'Buttons', navigationName: '/buttons'),
          buildButton(context,
              text: 'ReisedButton', navigationName: '/reisedButtons'),
          buildButton(context,
              text: 'ListViews使用', navigationName: '/listViews'),
          buildButton(context,
              text: 'GridViews使用', navigationName: '/gridViews'),
          buildButton(context,
              text: '可展开列表', navigationName: '/listViewChange'),
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
