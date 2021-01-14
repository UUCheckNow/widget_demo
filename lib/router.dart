import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/async_refresh_ui/future_builder.dart';
import 'package:widget_demo/async_refresh_ui/stream_builder.dart';
import 'package:widget_demo/banner/banner_page.dart';
import 'package:widget_demo/buttons/buttons.dart';
import 'package:widget_demo/buttons/friendsList.dart';
import 'package:widget_demo/buttons/reisedbutton.dart';
import 'package:widget_demo/dart/provider_route.dart';
import 'package:widget_demo/gridviews/gridview_goods.dart';
import 'package:widget_demo/keyboard_page/keyboard_page.dart';
import 'package:widget_demo/listviews/listview_change.dart';
import 'package:widget_demo/listviews/listview_use_image.dart';
import 'package:widget_demo/qr_code/qr_code_page.dart';
import 'package:widget_demo/search/group_list.dart';
import 'package:widget_demo/search/search_page.dart';
import 'package:widget_demo/theme/theme_test_route.dart';
import 'animation/animation_button.dart';
import 'buttons/popupmenubutton.dart';
import 'custom_painter/bar_chart.dart';
import 'custom_painter/chart_page.dart';
import 'custom_painter/donut_chart_page.dart';
import 'custom_painter/pie_chart_page.dart';
import 'dio/dio_page.dart';
import 'main.dart';

class RouteNames {
  static const String MAINPAGE = '/';
  static const String CHARTTESTPAGE = '/ChartTestPage';
  static const String CHARTPAGE = '/ChartPage';
  static const String DONUTCHARTPAGE = '/Rectangle';
  static const String BANNERPAGE = '/BannerPage';
  static const String QRCODEPAGE = '/QRCodePage';
  static const String ANIMATIONBUTTONPAGE = '/animationButtonPage';
  static const String KEYBOARDPAGE = '/keyBoardPage';
  static const String DIOPAGE = '/dioPage';
  static const String FUTUREBUILDROUTE = '/futureBuilderRoute';
  static const String STREAMBUILDROUTE = '/streamBuilderRoute';
  static const String THEMETESTROUTE = '/themeTestRoute';
  static const String BASICAPPBARSAMPLE = '/basicAppBarSample';
  static const String SEARCHRESULTLIST = '/searchResultList';
  static const String BUTTONS = '/buttons';
  static const String REISEDBUTTONS = '/reisedButtons';
  static const String LISTVIEWS = '/listViews';
  static const String GRIDVIEWS = '/gridViews';
  static const String LISTVIEWCHANGE = '/listViewChange';
  static const String PROVIDERROUTE = '/providerRoute';
  static const String SEARCHPAGE = '/searchPage';
  static const String XBTESTPAGE = '/xbTestPage';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.CHARTTESTPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.CHARTTESTPAGE),
          builder: (context) => ChartTestPage(),
        );

      case RouteNames.CHARTPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.CHARTPAGE),
          builder: (context) => ChartPage(),
        );

      case RouteNames.DONUTCHARTPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.DONUTCHARTPAGE),
          builder: (context) => DonutChartPage(),
        );

      case RouteNames.BANNERPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.BANNERPAGE),
          builder: (context) => BannerPage(),
        );

      case RouteNames.QRCODEPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.QRCODEPAGE),
          builder: (context) => QRCodePage(),
        );

      case RouteNames.ANIMATIONBUTTONPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.ANIMATIONBUTTONPAGE),
          builder: (context) => AnimationButtonPage(),
        );
      case RouteNames.KEYBOARDPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(
              name: RouteNames.KEYBOARDPAGE, arguments: settings.arguments),
          builder: (context) => KeyBoardPage(arguments: settings.arguments),
        );
      case RouteNames.DIOPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.DIOPAGE),
          builder: (context) => DioPage(),
        );
      case RouteNames.FUTUREBUILDROUTE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.FUTUREBUILDROUTE),
          builder: (context) => FutureBuilderRoute(),
        );
      case RouteNames.STREAMBUILDROUTE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.STREAMBUILDROUTE),
          builder: (context) => StreamBuilderRoute(),
        );
      case RouteNames.THEMETESTROUTE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.THEMETESTROUTE),
          builder: (context) => ThemeTestRoute(),
        );
      case RouteNames.BASICAPPBARSAMPLE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.BASICAPPBARSAMPLE),
          builder: (context) => BasicAppBarSample(),
        );
      case RouteNames.SEARCHRESULTLIST:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.SEARCHRESULTLIST),
          builder: (context) => SearchResultList(),
        );
      case RouteNames.BUTTONS:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.BUTTONS),
          builder: (context) => Buttons(),
        );
      case RouteNames.REISEDBUTTONS:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.REISEDBUTTONS),
          builder: (context) => ReisedButtons(),
        );
      case RouteNames.LISTVIEWS:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.LISTVIEWS),
          builder: (context) => ListViews(),
        );
      case RouteNames.GRIDVIEWS:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.GRIDVIEWS),
          builder: (context) => GridViews(),
        );
      case RouteNames.LISTVIEWCHANGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.LISTVIEWCHANGE),
          builder: (context) => ListViewChange(),
        );
      case RouteNames.PROVIDERROUTE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.PROVIDERROUTE),
          builder: (context) => ProviderRoute(),
        );
      case RouteNames.SEARCHPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.SEARCHPAGE),
          builder: (context) => SearchPage(),
        );
      case RouteNames.XBTESTPAGE:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.XBTESTPAGE),
          builder: (context) => XBTestPage(),
        );

      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: RouteNames.MAINPAGE),
          builder: (context) => MainPage(),
        );
    }
  }
}
