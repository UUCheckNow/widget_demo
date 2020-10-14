import 'package:widget_demo/dio/entity_factory.dart';

class BaseListEntity<T> {
  int code;
  String message;
  List<T> data;

  BaseListEntity({this.code, this.message, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = List();
    if (json["data"] != null) {}
    (json["data"] as List).forEach((element) {
      mData.add(EntityFactory.generateOBJ<T>(element));
    });

    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}
