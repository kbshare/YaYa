import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'method_channel.dart';

class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  var _data;

  String _time;
  String _basicMessageTime;

  @override
  void initState() {
    super.initState();
    YaMethodChannel()
        .yaMethodFlutterChannel
        .setMethodCallHandler((MethodCall call) {
      setState(() {
        if (call.method == 'timer') {
          _time = call.arguments['time'];
        } else {
          print('其他方法');
        }
      });
    });

    YaMethodChannel().yaMessageFlutterChannel.setMessageHandler((message) {
      setState(() {
        _basicMessageTime = message['msgtimer'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text('MethodChannel 交互方式'),
          RaisedButton(
            child: Text('发送数据到原生dddddddd'),
            onPressed: () async {
              var result = await YaMethodChannel()
                  .yaMethodFlutterChannel
                  .invokeMethod('sendData', {'name': 'laomeng', 'age': 18});
              var name = result['name'];
              var age = result['age'];
              setState(() {
                _data = '$name,$age';
              });
            },
          ),
          Text('原生返回数据：$_data'),
          SizedBox(
            height: 50,
          ),
          Text('当前时间:$_time'),
          // Text('MethodChannel 交互方式')
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            color: Colors.pink,
          ),
          Container(
            child: Expanded(
              child: Text('BasicMessageChannel 交互方式'),
            ),
            height: 30,
          ),
          RaisedButton(
            child: Text('发送数据到原生dddddddd'),
            onPressed: () async {
              var result = await YaMethodChannel()
                  .yaMessageFlutterChannel
                  .send({'name': 'laomeng', 'age': 18});
              var name = result['name'];
              var age = result['age'];
              setState(() {
                _data = '$name,$age';
              });
            },
          ),
          Text('原生返回数据：$_data'),
          SizedBox(
            height: 50,
          ),
          Text('BasicMessageTime当前时间:$_basicMessageTime'),
        ],
      ),
    );
  }
}
