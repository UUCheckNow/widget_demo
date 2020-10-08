import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/sources/listdata.dart';

/*指定内容widget*/ //(block 不需要用有状态组件，改变界面参数的时候才用)
class SpecifiedContent extends StatelessWidget {
  final ValueSetter<String> specifiedBtnCallBack; // 点击 指定内容 回调

  const SpecifiedContent({Key key, this.specifiedBtnCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          crossAxisCount: 3,
          childAspectRatio: 2.8),
      itemBuilder: this._getListData,
    );
  }

  Widget _getListData(context, index) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        this.specifiedBtnCallBack(listData[index]["specified"]);
        // widget.keyWord = ;
        // });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            listData[index]["specified"],
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Positioned(
            right: 0.5,
            child: Container(
              width: ((index + 1) % 3 == 0) ? 0 : 0.5,
              height: 16,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}

/*最近搜索widget*/
class RecentSearch extends StatefulWidget {
  RecentSearch({Key key, this.resultList, this.recentBtnCallrBack})
      : super(key: key);
  final List resultList;
  final ValueSetter<String> recentBtnCallrBack; // 点击 最近搜索 回调

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8),
        ),
        Row(
          children: [
            Expanded(
              // 充满主轴
              child: TopTitle("最近搜索"),
            ),
            Container(
              color: Colors.white,
              child: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  print("删除删除");
                  setState(() {
                    widget.resultList.clear();
                  });
                },
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.white,
          child: Wrap(
            spacing: 15,
            children: List.generate(widget.resultList.length, (index) {
              return RawChip(
                label: Text(
                  widget.resultList[index],
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: Color.fromRGBO(30, 34, 43, 0.05),
                padding: EdgeInsets.symmetric(vertical: 8),
                onPressed: () {
                  print("终于写好");
                  widget.recentBtnCallrBack(widget.resultList[index]);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

/*模块标题*/
class TopTitle extends StatelessWidget {
  final title;
  TopTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.only(top: 12, left: 20),
      color: Colors.white,
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
