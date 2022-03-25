import 'package:flutter/services.dart';

class YaMethodChannel {
  final yaMethodFlutterChannel = MethodChannel('com.kbmore.yachannel');

  final yaMessageFlutterChannel = BasicMessageChannel(
      'com.kbmore.yamessagechannel', StandardMessageCodec());

  final yaEventChannel = EventChannel('com.kbmore.yaeventchannel');
}
