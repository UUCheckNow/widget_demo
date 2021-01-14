import 'dart:async';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<BannerModel> images;

  const Carousel({Key key, this.images}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Carousel> {
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1);
  int _currentIndex = 1;

  Timer _timer;

  @override
  void initState() {
    print(widget.images.asMap());
    if (widget.images.length > 0) {
      _setTimer();
    }
    super.initState();
  }

//设置定时器
  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    List addedImages = [];
    if (widget.images.length > 0) {
      addedImages
        ..add(widget.images[widget.images.length - 1])
        ..addAll(widget.images)
        ..add(widget.images[0]);
    }
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 3,
        child: Stack(
          children: [
            NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    notification is ScrollStartNotification) {
                  if (notification.dragDetails != null) {
                    _timer.cancel();
                  }
                } else if (notification is ScrollEndNotification) {
                  _timer.cancel();
                  _setTimer();
                }
                return null;
              },
              child: widget.images.length > 0
                  ? PageView(
                      physics: BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (page) {
                        int newIndex;
                        if (page == addedImages.length - 1) {
                          newIndex = 1;
                          _pageController.jumpToPage(newIndex);
                        } else if (page == 0) {
                          newIndex = addedImages.length - 2;
                          _pageController.jumpToPage(newIndex);
                        } else {
                          newIndex = page;
                        }
                        setState(() {
                          _currentIndex = newIndex;
                        });
                      },
                      children: addedImages
                          .map((item) => Container(
                                margin: EdgeInsets.all(20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    item.url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 25.0,
              left: 0,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.images
                    .asMap()
                    .map((i, v) => MapEntry(
                        i,
                        Container(
                          width: 6.0,
                          height: 6.0,
                          margin: EdgeInsets.only(left: 2.0, right: 2.0),
                          decoration: ShapeDecoration(
                              color: _currentIndex == i + 1
                                  ? Colors.red
                                  : Colors.white,
                              shape: CircleBorder()),
                        )))
                    .values
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class BannerModel extends Object {
  final String image; // 本地图片路径
  final String url; // 网络URL

  // 当有网络连接时会优先使用网络图片，没有则使用本地图片
  BannerModel(this.url, {this.image}); // image为可选参数，
}
