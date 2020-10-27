import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 登录模块按钮自定义
class MyCustomButton extends StatefulWidget {
  const MyCustomButton({
    Key key,
    this.text = "确定",
    this.pressed = null,
    this.width = 120.0,
    this.height = 52.0,
    this.loading = false,
    this.startLoading = false,
  }) : super(key: key);

  // 标题 默认 “确定”
  final text;
  // 点击事件 默认不可点
  final pressed;
  // 宽 默认120
  final width;
  // 高 默认52
  final height;
  // 按钮是否带动画图标
  final loading;
  // 开始动画
  final startLoading;

  @override
  _MyCustomButtonState createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton>
    with TickerProviderStateMixin {
  //动画控制器
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //重置起点
        _controller.reset();
        //开启
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //旋转
  Widget _buildRotationTransition() {
    if (widget.startLoading) {
      _controller.forward();
    } else {
      _controller.reset();
    }

    return RotationTransition(
      //设置动画的旋转中心
      alignment: Alignment.center,
      //动画控制器
      turns: _controller,
      //将要执行动画的子view
      child: SizedBox(
        width: 52,
        height: 52,
        child: Icon(
          Icons.refresh,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      height: this.widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          RaisedButton(
            color: Colors.blue,
            disabledColor: Colors.black12,
            textColor: Colors.white,
            disabledTextColor: Colors.grey,
            onPressed: this.widget.pressed,
            child: Text(
              this.widget.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          widget.loading == true
              ? Positioned(left: 0, child: _buildRotationTransition())
              : Container(),
        ],
      ),
    );
  }
}
