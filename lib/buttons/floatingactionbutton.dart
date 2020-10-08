import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*一个圆形图标按钮，它悬停在内容之上，以展示应用程序中的主要动作。FloatingActionButton通常用于Scaffold.floatingActionButton字段。*/
class FloatingactionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingactionButton"),
      ),
      body: Center(
        child: const Text("data"),
      ),
      floatingActionButton: FloatingActionButton(
        // 只有图标的圆形底部悬浮按钮
        onPressed: () {},
        child: Icon(Icons.favorite),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation:
          /* startDocked:   开始对齐的FloatingActionButton，浮动在Scaffold.bottomNavigationBar上方， 以便浮动操作按钮的中心与底部导航栏的顶部对齐
          *  centerFloat:   居中的FloatingActionButton，浮动在屏幕底部。
          *  endTop:        末端对齐的FloatingActionButton，在Scaffold.appBar和Scaffold.body之间的过渡上浮动
          *  miniEndFloat:  末端对齐的FloatingActionButton，浮动在屏幕底部，针对微型浮动操作按钮进行了优化
          * */
          FloatingActionButtonLocation
              .miniCenterDocked, // 居中的FloatingActionButton，浮动在Scaffold.bottomNavigationBar上方， 以便浮动动作按钮的中心与底部导航栏的顶部对齐；旨在与FloatingActionButton.mini设置为true一起使用
      floatingActionButtonAnimator:
          FloatingActionButtonAnimator.scaling, // 这里不是很懂

      // floatingActionButton: FloatingActionButton.extended( // 带图标和文字的底部悬浮按钮
      //   onPressed: () {},
      //   label: Text("hello"),
      //   icon: Icon(Icons.chat),
      //   backgroundColor: Colors.amber,
      // )
    );
  }
}

/*------------使用FloatingActionButtonLocation   高仿  咸鱼TabBar------------*/
