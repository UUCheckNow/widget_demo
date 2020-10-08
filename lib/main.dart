import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/search/search_page.dart';

import 'buttons/popupmenubutton.dart';

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
              text: 'popupmenubutton', navigationName: '/basicAppBarSample'),
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
