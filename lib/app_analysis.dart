import 'package:flutter/cupertino.dart';
import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';

class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route.settings.name != null) {
      UmengAnalyticsPlugin.pageStart(route.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route.settings.name != null) {
      UmengAnalyticsPlugin.pageEnd(route.settings.name);
    }
  }
}
