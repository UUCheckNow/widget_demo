import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/app_analysis.dart';
import 'package:widget_demo/router.dart';
import 'package:widget_demo/software_application.dart';
// void main() => FlutterBugly.postCatchedException(
//       () => runApp(MyApp()),
//       debugUpload: true,
//     );

void main() {
//   debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: new MyApp(),
  ));
  SoftwareApplication.getInstance().onCreate(); // 接入 友盟统计
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute,
      navigatorObservers: [AppAnalysis()],
      initialRoute: '/',
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              _hello();
              // UmengAnalyticsPlugin.event('clickSearch');
              // Navigator.of(context).pushNamed("/searchPage");
            },
          )
        ],
      ),
      body: ListView(
        children: [
          buildButton(context,
              text: '第三方环状图', navigationName: RouteNames.CHARTTESTPAGE),
          buildButton(context,
              text: '绘制柱状图', navigationName: RouteNames.CHARTPAGE),
          buildButton(context,
              text: '绘制环状图', navigationName: RouteNames.DONUTCHARTPAGE),
          buildButton(context,
              text: 'banner', navigationName: RouteNames.BANNERPAGE),
          buildButton(context,
              text: '扫一扫', navigationName: RouteNames.QRCODEPAGE),
          buildButton(context,
              text: '通讯录', navigationName: RouteNames.XBTESTPAGE),
          buildButton(context,
              text: '登录按钮过渡动画', navigationName: RouteNames.ANIMATIONBUTTONPAGE),
          buildButton(context,
              text: '键盘自适应', navigationName: RouteNames.KEYBOARDPAGE),
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

  _hello() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Container(
              height: 25,
              width: double.infinity,
              color: Colors.black54,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Center(child: Text("showModalBottomSheet")),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ],
        );
      },
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
