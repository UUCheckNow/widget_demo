import 'package:flutter/cupertino.dart';
import 'package:widget_demo/dart/goods_item.dart';

class ChangeNotifier implements Listenable {
  List listeners = [];

  @override
  void addListener(listener) {
    // TODO: implement addListener
    listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
    listeners.remove(listener);
  }

  void notifyListeners() {
    listeners.forEach((item) => item());
  }
}
