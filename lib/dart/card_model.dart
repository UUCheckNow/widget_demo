import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:widget_demo/dart/goods_item.dart';

class CardModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class MyModel with ChangeNotifier {
  /*私有变量*/
  List<Item> _items = [];
  List<Item> get items => _items;

  set items(List<Item> value) {
    _items = value;
  }

  upDataName(String value, int index) {
    _items[index].name = value;
    notifyListeners();
  }
}
