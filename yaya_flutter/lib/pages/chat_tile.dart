import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() action;

  const ChatTile({Key key, this.title, this.subTitle, this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        onTap: action,
      ),
      color: Colors.lightBlue[100],
    );
  }
}
