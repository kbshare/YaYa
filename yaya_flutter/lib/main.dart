import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yaya_flutter/common/app_pages.dart';
import 'package:yaya_flutter/common/app_routes.dart';
import 'package:yaya_flutter/pages/friends/friends_page.dart';
import 'package:yaya_flutter/pages/mine_page.dart';

import './pages/root_page.dart';
import './pages/discover/discover_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
//void main() => runApp(MyApp());

void main() {
  runApp(
    MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
  );
}

@pragma('vm:entry-point')
void connactsAPPEntry() => runApp(
      ConnactsAPP(),
    );

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key key, this.initialRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo', //安卓里面,进入后台时,显示的APP名称
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
      ),
      home: RootPage(),
      getPages: AppPages.pages,
      initialRoute: this.initialRoute,
      unknownRoute: AppPages.UnknownRoute,
    );
  }
}

//通讯录页面
class ConnactsAPP extends StatelessWidget {
  const ConnactsAPP({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', //安卓里面
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
      ),
      getPages: [],
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo', //安卓里面
    //   theme: ThemeData(
    //     primarySwatch: Colors.yellow,
    //     highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
    //     splashColor: Color.fromRGBO(1, 0, 0, 0.0),
    //   ),
    //   routes: {
    //     'connacts': (BuildContext context) => FriendsPage(),
    //     'mine': (BuildContext context) => MinePage(),
    //     'discover': (BuildContext context) => DiscoverPage(),
    //   },
    //   // home: RootPage(),
    //   // initialRoute: this.initialRoute,
    // );
  }
}
