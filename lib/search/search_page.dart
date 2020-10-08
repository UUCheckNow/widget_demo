import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/search/search_bar.dart';
import 'package:widget_demo/search/search_dao.dart';
import 'package:widget_demo/search/search_model.dart';
import 'package:widget_demo/search/search_widget.dart';
import 'package:widget_demo/search/webview.dart';

const URL =
    "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=";

enum SearchResultType {
  channelgroup,
  gs,
  plane,
  train,
  cruise,
  district,
  food,
  hotel,
  huodong,
  shop,
  sight,
  ticket,
  travelgroup
}

class SearchPage extends StatefulWidget {
  // 定义一个是否隐藏左边返回按钮的 入参
  final bool hideLeft;
  final String searchUrl;
  final String keyWord;
  final String hint;

  // 彩蛋：URL要设置默认值
  const SearchPage(
      {Key key, this.hideLeft, this.searchUrl = URL, this.keyWord, this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel; // 搜索出来的结果模型
  String keyword; // 搜索关键字
  bool input = false; // 是否正在输入
  List _searchText = ["hello"]; //搜索历史列表

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
          // 彩蛋：MediaQuery 去除ListView顶部间隙的
          MediaQuery.removePadding(
            context: context,
            removeTop: true, // 注意：要告诉它需要移除哪个方位的空隙
            // 彩蛋：需要填充整个屏幕或者需要设置高度时，可以在外层包一个 Expanded
            child: Expanded(
              flex: 1,
              child: input
                  ? ListView.builder(
                      itemCount: searchModel?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int position) {
                        return _item(position);
                      })
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        TopTitle("指定内容"),
                        Container(
                            color: Colors.white,
                            child: SpecifiedContent(
                              specifiedBtnCallBack: (texts) {
                                _onTextChanged(texts);
                              },
                            )),
                        RecentSearch(
                          resultList: _searchText,
                          recentBtnCallrBack: (texts) {
                            _onTextChanged(texts);
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            // AppBar渐变遮罩背景 （半透明黑色 + 透明色）
            colors: [Color(0x66000000), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Container(
            // 顶部安全距离
            padding: EdgeInsets.only(top: 20),
            // 搜索框高度
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyWord,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              rightButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChanged,
            ),
          ),
        )
      ],
    );
  }

  _item(int position) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchItem item = searchModel.data[position];
    for (final val in SearchResultType.values) {
      String valstr = val.toString().split(".").last; // 枚举转字符串
      if (item.type.contains(valstr)) {}
    }
    // 用GestureDetector包裹 实现item可点击
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: item.url,
                      title: "详情",
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(1),
              width: 33,
              height: 33,
              child: Image(image: AssetImage(_typeImage(item.type))),
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 5),
                  child: _subTitle(item),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _onTextChanged(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        input = false;
        searchModel = null;
      });
      return;
    }
    String url = widget.searchUrl + text;
    SearchDao.fetch(url, text).then((SearchModel value) {
      //优化点：只有当当前输入的内容和服务端返回的内容一致时才渲染
      if (value.keyword == keyword) {
        setState(() {
          input = true;
          searchModel = value;
          _searchText.add(text);
        });
      }
    }).catchError((e) {
      // 展示错误界面或者打印错误
      print(e);
    });
  }

  _typeImage(String type) {
    if (type == null) return "images/type_travelgroup.png";
    String path = "travelgroup";
    for (final val in SearchResultType.values) {
      String valstr = val.toString().split(".").last; // 枚举转字符串
      if (type.contains(valstr)) {
        path = valstr;
        break;
      }
    }
    return "images/type_${path}.png";
  }

  _title(SearchItem item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(
        (item.word ?? "") + (item.type ?? ""), (searchModel.keyword ?? "")));
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchItem item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(
        (item.districtname ?? "") + " " + (item.word ?? "") + (item.type ?? ""),
        (searchModel.keyword ?? "")));
    return RichText(text: TextSpan(children: spans));
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word.length == 0 || word == null) return spans;
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.blue);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
