class Item {
  double _price = 0; // 商品单价
  int _count = 0; // 商品数量
  String _name = "";

  Item({double price, int count, String name})
      : this._price = price,
        this._count = count,
        this._name = name ?? false;

  double get price => _price;
  int get count => _count;
  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
