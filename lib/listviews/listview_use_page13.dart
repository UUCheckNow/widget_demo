import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListViewUsePage13 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///加载图片的标识
  bool isLoadingImage = true;

  ///网络图片地址
  String netImageUrl =
      "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///列表
      body: NotificationListener(
        ///子Widget中的滚动组件滑动时就会分发滚动通知
        child: buildListView(),

        ///每当有滑动通知时就会回调此方法
        onNotification: notificationFunction,
      ),
    );
  }

  bool notificationFunction(Notification notification) {
    ///通知类型
    switch (notification.runtimeType) {
      case ScrollStartNotification:
        print("开始滚动");

        ///在这里更新标识 刷新页面 不加载图片
        isLoadingImage = false;
        break;
      case ScrollUpdateNotification:
        print("正在滚动");
        break;
      case ScrollEndNotification:
        print("滚动停止");

        ///在这里更新标识 刷新页面 加载图片
        setState(() {
          isLoadingImage = true;
        });
        break;
      case OverscrollNotification:
        print("滚动到边界");
        break;
    }
    return true;
  }

  ListView buildListView() {
    return ListView.separated(
      itemCount: 10000, //子条目个数
      ///构建每个条目
      itemBuilder: (BuildContext context, int index) {
        if (isLoadingImage) {
          ///这时将子条目单独封装在了一个StatefulWidget中
          return Image.network(
            netImageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.fitHeight,
          );
        } else {
          return Container(
            height: 100,
            width: 100,
            child: Text("加载中..."),
          ); //占位
        }
      },

      ///构建每个子Item之间的间隔Widget
      separatorBuilder: (BuildContext context, int index) {
        return new Divider();
      },
    );
  }
}
