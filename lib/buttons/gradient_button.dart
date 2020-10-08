import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ---------自定义渐变色按钮的解决方案-------------

/*方案一：带阴影和点波纹按钮的自定义*/
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

//点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius,
          // 阴影的设置
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                spreadRadius: 2.0),
          ]),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*方案二：带点波纹不带阴影的渐变色按钮*/
class ContainerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 36,
      width: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.redAccent, Colors.yellow]), // 渐变色
          borderRadius: BorderRadius.circular(6)),
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.transparent, // 设为透明色
        elevation: 0, // 正常时阴影隐藏
        highlightElevation: 0, // 点击时阴影隐藏
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '波纹',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

/*方案三：带阴影不带点波纹的渐变色按钮*/
class ContainerShadowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0), // 手动设置填充边界距离
      child: Container(
        // 一个容器
        decoration: const BoxDecoration(
          // 一个形状
          // 给它一个渐变色
          gradient: LinearGradient(
            // 设置渐变属性
            begin: Alignment.topLeft, // 指定开始和结束的渐变位置
            end: Alignment.bottomRight,
            colors: <Color>[
              // 设置渐变颜色
              Color(0xFDFF47A1),
              Color(0xFDFF76D2),
              Color(0xFDFFA5F5),
            ],
          ),
        ),
        // padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        padding: const EdgeInsets.all(10.0), // 按钮外边距（向四周扩大10）
        child: const Text(
          "不带点波纹渐变",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
