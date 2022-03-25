import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yaya_flutter/common/login_middle_ware.dart';
import 'package:yaya_flutter/common/unknown_page.dart';
import 'package:yaya_flutter/pages/chat_page.dart';
import 'package:yaya_flutter/pages/getx_page.dart';
import 'package:yaya_flutter/pages/login/setpwd_page.dart';
import '../common/app_routes.dart';
import '../pages/login/login_page.dart';

class AppPages {
  static const INITIAL = Routes.Chat;

  static final List<GetPage> pages = [
    GetPage(
        name: Routes.Chat,
        page: () {
          return ChatPage();
        },
        children: [
          GetPage(
            name: Routes.GetXPage,
            page: () => GetxPage(),
          ),
        ]),
    GetPage(
      name: Routes.GetXPage,
      page: () => GetxPage(),
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginPage(),
    ),
    GetPage(name: Routes.SetPwd, page: () => SetPwdPage(), middlewares: [
      LoginMiddleWare(priority: 1),
    ])
  ];

  static final UnknownRoute =
      GetPage(name: Routes.UnknownPage, page: () => UnKnownPage());
}
