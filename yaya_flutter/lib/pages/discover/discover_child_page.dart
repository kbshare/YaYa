import 'package:flutter/material.dart';

import '../const.dart';

class sssss extends StatefulWidget {
 
  @override
  _sssssState createState() => _sssssState();
}

class _sssssState extends State<sssss> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DiscoverChildPage extends StatefulWidget {
  final String title;

  const DiscoverChildPage({Key key, this.title}) : super(key: key);

  @override
  _DiscoverChildPageState createState() => _DiscoverChildPageState();
}

class _DiscoverChildPageState extends State<DiscoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
