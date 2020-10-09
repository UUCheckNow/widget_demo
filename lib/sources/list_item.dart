import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/search/group_list_detail.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            heading,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
        ),
        Container(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchResultDetailList()));
          },
          child: Text("查看更多>"),
        )),
      ],
    );
  }
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
                "https://c-ssl.duitang.com/uploads/item/202002/02/20200202110819_jJCrc.thumb.700_0.jpeg"),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: Theme.of(context).textTheme.subtitle1,
              maxLines: 1,
            ),
            Text(
              body,
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}
