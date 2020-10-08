/// 搜索模型
class SearchModel {
  String keyword;
  final List<SearchItem> data;

  SearchModel({this.data});
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json["data"] as List; // 取出dataJson并转化成list
    List<SearchItem> data =
        dataJson.map((e) => SearchItem.fromJson(e)).toList();
    return SearchModel(data: data);
  }
}

class SearchItem {
  final String code;
  final String word; //xx酒店
  final String type; //hotel
  final String districtname; //上海
  final String url;

  SearchItem({this.code, this.word, this.type, this.districtname, this.url});

  // 使用工厂方法转化
  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      code: json['code'],
      word: json["word"],
      type: json['type'],
      districtname: json['districtname'],
      url: json['url'],
    );
  }
}
