import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaya_flutter/common/app_routes.dart';
import 'package:yaya_flutter/pages/chat_tile.dart';
import 'package:yaya_flutter/pages/method_channel.dart';
import 'package:logger/logger.dart';
import 'const.dart';
import 'getx_page.dart';
import 'method_channel_page.dart';
import 'package:logger_flutter/logger_flutter.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final arr = [
    "1",
    "2",
    "13",
  ];

  @override
  void initState() {
    super.initState();
    print(<Widget>[
      // this is the syntax for a Set<Widget> literal
      const SizedBox(),
      const SizedBox(),
    ].length);
  }

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  int _key1 = 0;
  String _buttontext = 'd';
  StreamController<int> _key1Stream = StreamController();

  StreamController<String> _textStream = StreamController();

  @override
  Widget build(BuildContext context) {
    String appendString() {
      _buttontext = _buttontext + 'zhan';
      return _buttontext;
    }

    ;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {
                  YaMethodChannel()
                      .yaMethodFlutterChannel
                      .invokeMethod('closeFlutter');
                },
                child: Text(
                  '关闭flutter',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MethodChannelDemo()));
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return ChatPage();
                  // }));
                },
                child: Text(
                  'flutter原生交互',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                )),
          ),
        ],
        backgroundColor: WeChatThemeColor,
        centerTitle: true,
        title: Text('微f点滴'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.bike_scooter),
          StreamBuilder<Object>(
              stream: _key1Stream.stream,
              builder: (context, snapshot) {
                return FlatButton(
                  onPressed: () {
                    _key1Stream.sink.add(_key1++);
                  },
                  child: Text('${snapshot.data}'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                );
              }),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: RaisedButton(
              onPressed: () {},
              child: Text("Button"),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: RaisedButton(
              onPressed: () {
                LogConsole();
              },
              child: Text("LogConsole"),
            ),
          ),
          StreamBuilder<dynamic>(
            stream: _textStream.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                // TODO: do something with the data
                return Text(snapshot.data);
              } else if (snapshot.hasError) {
                // TODO: do something with the error
                return Text(snapshot.error.toString());
              }
              // TODO: the data is not ready, show a loading indicator
              return Center(child: CircularProgressIndicator());
            },
          ),
          IconButton(
              icon: Icon(Icons.touch_app),
              onPressed: () => {_textStream.sink.add(appendString())}),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: RaisedButton(
              onPressed: () {},
              child: Text('权限设置页面'),
            ),
          ),
          ChatTile(
              title: 'getx',
              subTitle: 'getx, controller d用',
              action: () {
                Get.toNamed(
                  Routes.GetXPage,
                  parameters: {'title': 'getx, controller d用'},
                );
                // Get.to(
                //   GetxPage(),
                //   arguments: {'title': 'getx, controller d用'},
                // );
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (BuildContext context) {
                //   return  GetxPage();
                //   }),
                // );
              }),
          ChatTile(
              title: '中间件-中间页面',
              subTitle: '中间件-中间页面使用',
              action: () {
                Get.toNamed(
                  Routes.SetPwd,
                  parameters: {'title': '中间件-中间页面'},
                );
              }),
          Divider(),
        ],
      ),
    );
  }
}
