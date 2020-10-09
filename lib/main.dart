import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/search/group_list.dart';
import 'package:widget_demo/search/search_page.dart';

import 'buttons/buttons.dart';
import 'buttons/popupmenubutton.dart';
import 'buttons/reisedbutton.dart';
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
        '/basicAppBarSample': (BuildContext context) => BasicAppBarSample(),
        '/searchResultList': (BuildContext context) => SearchResultList(),
        '/buttons': (BuildContext context) => Buttons(),
        '/reisedButtons': (BuildContext context) => ReisedButtons(),
        '/listViews': (BuildContext context) => ListViews(),
        '/gridViews': (BuildContext context) => GridViews(),
        '/listViewChange': (BuildContext context) => ListViewChange(),
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
