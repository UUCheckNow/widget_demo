import 'dart:math' as math;

import 'package:flutter/material.dart';

/// NineGridView.
/// like WeChat, WeiBo International, WeChat group, DingTalk group, QQ group.
///
/// Another [NineGridView](https://github.com/flutterchina/flukit) in [flukit](https://github.com/flutterchina/flukit) UI Kit，using GridView implementation。
class NineGridView extends StatefulWidget {
  NineGridView({
    Key key,
    this.width = 60,
    this.height = 60,
    this.space: 3,
    this.padding: EdgeInsets.zero,
    this.margin: EdgeInsets.zero,
    @required this.itemCount,
    @required this.itemBuilder,
  })  : assert(itemCount == null || itemCount >= 1),
        assert(itemBuilder != null),
        super(key: key);

  /// View width.
  final double width;

  /// View height.
  final double height;

  /// The number of logical pixels between each child.
  final double space;

  /// View padding.
  final EdgeInsets padding;

  /// View margin.
  final EdgeInsets margin;

  /// The total number of children this delegate can provide.
  final int itemCount;

  /// Called to build children for the view.
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() {
    return _NineGridViewState();
  }
}

/// _NineGridViewState.
class _NineGridViewState extends State<NineGridView> {
  @override
  Widget build(BuildContext context) {
    double realWidth = widget.width;
    double realHeight = widget.height;
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      width: realWidth,
      height: realHeight,
      child: _buildFXGroupAvatar(context),
    );
  }

  /// build dingTalk group.
  Widget _buildFXGroupAvatar(BuildContext context) {
    double width = widget.width - widget.padding.left - widget.padding.right;
    int itemCount = math.min(4, widget.itemCount);
    double itemW = (width - widget.space) / 2;
    List<Widget> children = List();
    for (int i = 0; i < itemCount; i++) {
      children.add(Positioned(
          top: (widget.space + itemW) * (i ~/ 2),
          left: (widget.space + itemW) *
              (((itemCount == 3 && i == 2) ? i + 1 : i) % 2),
          child: SizedBox(
            width: itemCount == 1 ? width : itemW,
            height:
                (itemCount == 1 || itemCount == 2 || (itemCount == 3 && i == 0))
                    ? width
                    : itemW,
            child: widget.itemBuilder(context, i),
          )));
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: children,
      ),
    );
  }
}
