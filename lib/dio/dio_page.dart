import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/dio/http_util.dart';
import 'package:widget_demo/search/search_model.dart';

import 'api.dart';
import 'dio_manager.dart';
import 'method.dart';

/*两种网络请求的封装*/
class DioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: "网络请求的复杂封装",
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              _search();
            },
          ),
          IconButton(
            tooltip: "网络请求的简单封装",
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              _ssssss();
            },
          ),
        ],
      ),
    );
  }

  /*网络请求的封装方案1（比较完善）*/
  _search() {
    Map map = new Map<String, dynamic>();
    map["keyword"] = "1";
    DioManager().request(Method.GET, Api.searchPath, params: map,
        success: (value) {
      SearchModel model = SearchModel.fromJson(value);
      print("${model.data[0].word}");
    });
  }

  /*网络请求的封装方案2（比较简单））*/
  _ssssss() {
    HttpUtil().getRequest(
        "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb",
        data: {"keyword": "1"}).then((value) {
      SearchModel model = SearchModel.fromJson(value);
      print(model.data[0].word);
    });
  }
}
