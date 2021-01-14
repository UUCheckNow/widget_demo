import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/banner/fx_custom_banner.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  List<BannerModel> _images = [
    BannerModel(
        "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg"),
    BannerModel(
        "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg"),
    BannerModel(
        "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg"),
    BannerModel(
        "https://c-ssl.duitang.com/uploads/item/201703/16/20170316223230_W5zFE.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Carousel(images: _images),
    );
  }
}
