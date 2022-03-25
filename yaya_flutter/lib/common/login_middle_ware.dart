import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaya_flutter/common/app_pages.dart';
import 'package:yaya_flutter/common/app_routes.dart';

class LoginMiddleWare extends GetMiddleware {
  int priority = 0;

  LoginMiddleWare({this.priority});

  @override
  RouteSettings redirect(String route) {
    return RouteSettings(name: Routes.Login);
  }

  // @override
  // GetPage? onPageCalled(GetPage? page) => page;

  // @override
  // List<Bindings>? onBindingsStart(List<Bindings>? bindings) => bindings;

  // @override
  // GetPageBuilder? onPageBuildStart(GetPageBuilder? page) => page;

  // @override
  // Widget onPageBuilt(Widget page) => page;

  // @override
  // void onPageDispose() {}
}
