import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/dart/card_model.dart';

import '../router.dart';
import 'change_notifier_provider.dart';
import 'goods_item.dart';

/*跨组件状态共享（Provider）实现*/
class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  MyModel model;

  List<Item> itemssss;

  List<Item> itemdddddddd;

  @override
  void initState() {
    super.initState();
    itemssss = List<Item>();
    itemssss.add(Item(price: 0, count: 0, name: "hello"));
    itemssss.add(Item(price: 0, count: 0, name: "hello1"));
    itemssss.add(Item(price: 0, count: 0, name: "hello2"));
    itemssss.add(Item(price: 0, count: 0, name: "hello3"));
    itemdddddddd = List<Item>();
    itemdddddddd.add(Item(price: 0, count: 0, name: "改变后的"));
    model = MyModel();
    model.items = itemssss;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dart"),
      ),
      body: Center(
        child: ChangeNotifierProvider<MyModel>(
          data: model,
          child: Builder(builder: (context) {
            return ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                var cart = ChangeNotifierProvider.of<MyModel>(context);
                return Column(
                  children: [
                    Text("总价: ${cart.items[index].name}"),
                    RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.KEYBOARDPAGE,
                            arguments: {"cart": cart, "index": index});
                      },
                    )
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
