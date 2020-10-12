import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/dart/card_model.dart';

import 'change_notifier_provider.dart';
import 'goods_item.dart';

/*跨组件状态共享（Provider）*/
class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dart"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CardModel>(
          data: CardModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Builder(builder: (context) {
                  var cart = ChangeNotifierProvider.of<CardModel>(context);
                  return Text("总价: ${cart.totalPrice}");
                }),
                Builder(builder: (context) {
                  print("RaisedButton build"); //在后面优化部分会用到
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CardModel>(context)
                          .add(Item(20.0, 1));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
