import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/sources/listdata.dart';

class GridViews extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      child: Column(
        children: [
          Image.network(
            listData[index]["imageUrl"],
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            listData[1]["title"],
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(42, 42, 42, 0.5), width: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView使用"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemBuilder: this._getListData),
    );
  }
}
