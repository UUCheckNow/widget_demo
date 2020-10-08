import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SearchBartype { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled; // 是否禁止搜索
  final bool hideLeft; // 是否隐藏左边返回按钮
  final SearchBartype searchBarType; //搜索框类型
  final String hint; // 搜索框提示
  final String defaultText; //  搜索默认文字
  final Void Function() leftButtonClick; // 左边按钮回调
  final Void Function() rightButtonClick; // 右边按钮回调
  final Void Function() speakboxClick; // 语音按钮回调
  final Void Function() inputBoxClick; // 输入框回调
  final ValueChanged<String> onChanged; // 输入框状态改变回调(带一个字符串)

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      // 需要设置默认值
      this.searchBarType = SearchBartype.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakboxClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // 是否显示清除按钮
  bool showClear = false;
  // 如果用到输入框，需要声明一个controller 用来获取输入框文字变化
  final TextEditingController _controller = TextEditingController();

  /*重写类的initsStatus方法*/
  @override
  void initState() {
    // 这句作用是： 如果点击了语音按钮识别成了文字以后需要显示到输入框中，
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBartype.normal
        ? _getNormalSearch()
        : _getHomeSearch();
  }

  /*默认输入框组件*/
  _getNormalSearch() {
    return Container(
      child: Row(
        //行布局
        children: [
          _wrapTap(
              Container(
                  // 最左边返回按钮布局
                  child: widget?.hideLeft ?? false
                      ? Padding(
                          padding: EdgeInsets.only(left: 20),
                        )
                      : Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 26,
                        )),
              widget.leftButtonClick),
          //中间的输入框布局
          // Expanded的作用是将输入框沿着主轴撑开,
          Expanded(flex: 1, child: _inputBox()),
          // 最右边取消按钮布局
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  /*首页顶部输入框组件*/
  _getHomeSearch() {}

  /*输入框组件*/
  _inputBox() {
    // 根据类型配置输入框颜色
    Color inputBoxColor;
    if (widget.searchBarType == SearchBartype.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse("0xffEDEDED"));
    }
    return Container(
      child: Container(
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: inputBoxColor,
            borderRadius: BorderRadius.circular(
                widget.searchBarType == SearchBartype.normal ? 5 : 15)),
        child: Row(
          children: [
            // 左边搜索图标
            Icon(
              Icons.search,
              size: 20,
              color: widget.searchBarType == SearchBartype.normal
                  ? Color(0xffa9a9a9)
                  : Colors.blue,
            ),
            // 中间的textfield
            Expanded(
                flex: 1, // 设置为1的话 宽度自适应
                child: widget.searchBarType == SearchBartype.normal
                    ? TextField(
                        controller: _controller,
                        onChanged: _onChanged,
                        autofocus: false,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                          contentPadding: //flutter sdk >= v1.12.1 输入框样式适配
                              EdgeInsets.only(left: 5, bottom: 15, right: 5),
                          border: InputBorder.none,
                          hintText: widget.hint ?? "",
                          hintStyle: TextStyle(fontSize: 16),
                        ), // 默认获取光标
                      )
                    : _wrapTap(
                        Container(
                          child: Text(
                            widget.defaultText,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        widget.inputBoxClick)),
            !showClear
                ? _wrapTap(
                    Icon(
                      Icons.mic,
                      size: 20,
                      color: widget.searchBarType == SearchBartype.normal
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    widget.speakboxClick)
                : _wrapTap(
                    Icon(
                      Icons.clear,
                      size: 20,
                      color: Colors.grey,
                    ), () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChanged("");
                  })
          ],
        ),
      ),
    );
  }

  /*给组件添加点击事件*/
  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  /*输入框_onChangeed方法实现*/
  _onChanged(String text) {
    // 根据判断输入框有没有内容来控制清除按钮的显示或隐藏
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    // 及时的将text传出去
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }
}
