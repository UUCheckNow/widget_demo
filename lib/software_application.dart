import 'package:umeng_analytics_plugin/umeng_analytics_plugin.dart';
import 'dart:async';

class SoftwareApplication {
  static SoftwareApplication instance;
  static SoftwareApplication getInstance() {
    if (instance == null) {
      instance = SoftwareApplication();
    }
    return instance;
  }

  void onCreate() {
    initUmengAnalyticsPlugin();
  }

  Future<void> initUmengAnalyticsPlugin() async {
    var result = await UmengAnalyticsPlugin.init(
      androidKey: '5f87ec5594846f78a9735279',
      iosKey: '5f87ec9594846f78a97352a3',
    );
    String res = result ? 'OK' : 'ERROR';
    print('Umeng initialized  => $res');
  }
}
