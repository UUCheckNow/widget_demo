import 'dart:convert';

import 'package:widget_demo/search/search_model.dart';

// class EntityFactory {
//   static T generateOBJ<T>(json) {
//     if (json == null) {
//       return null;
//     }
//     //可以在这里加入任何需要并且可以转换的类型，例如下面
//     else if (T.toString() == "SearchModel") {
//       Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//       var result = json.decode(utf8decoder.convert(json.bodyBytes));
//       return SearchModel.fromJson(result) as T;
//     } else {
//       Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
//       var result = json.decode(utf8decoder.convert(json.bodyBytes));
//       return result as T;
//     }
//   }
// }

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
    return json as T;
  }
}
