
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'route_handler.dart';

/*
 * WYRouter
 * Created by wuweiyi in 21:49 in 9/9/2019
 * 
 * Copyright (c) 2019 wuweiyi, LLC. All rights reserved.
 */

/// [用法]
/// 外部: 
///      1. 使用[WYRouter.generator]进行路由注册
///      2. 使用[WYRouter.to(context, Routes.xxx, params)]进行路由跳转，暂时不支持自定义跳转动画
/// 
/// 内部:
///      1. 在[_RoutesConfig]类中配置路由映射表, 格式如下
///           Map<String, dynamic> map = { "route": 'xxx', "params" : ['xxx','xxx'] }
///      2. 在[Routes]中配置路由, 供外部使用

class Routes {
    static final String homeWebViewRoute = _RoutesConfig.homeWebViewRoute['route'];
}

class _RoutesConfig {

  static const String root = '/';
  // 首页顶层nav的webview页面
  static const Map<String, dynamic> homeWebViewRoute = {
    "route": root + 'home_nav_webView',
    "params":['url','statusColor','hideAppBar']
  };

  static void setup(Router router) {

    // splicing the route path, the result look like '/route/paramKey:paramValue'
    String fetchRoutePath(Map<String, dynamic> routeMap) {
      String routePath = routeMap['route'];
      List<String> params = routeMap['params'];
      params.forEach((String param) => routePath = routePath + '/:' + param );
      return routePath;
    }

    // the widget will show if page is not found
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext ctx, Map<String, List<String>> params) {
        return Container(
          alignment: Alignment.center,
          child: Center(child: Text("Oh,oh! The page is not found!")
        ));
      }
    );

    // define the route with handler
    router.define(fetchRoutePath(homeWebViewRoute), handler: webViewHandler);
  }
}

class WYRouter {

  // public
  Route<dynamic> Function(RouteSettings) get generator => _PrivateRouter.router.generator;

  // constructor
  WYRouter() {
    _RoutesConfig.setup(_PrivateRouter.router);
  }

  // push
  static void to({BuildContext context, String route, Map<String, dynamic> params}) {
      // splicing the route path, the result look like '/route/paramValue'
      String routePath = route;
      params.forEach((String key, dynamic val) => routePath = routePath + '/' + val.toString());
      _PrivateRouter.router.navigateTo(context, routePath, transition: TransitionType.fadeIn);
  }
}

// 声明这个私有类是为了内部持有Router这个变量，这样外部无法调用到router直接push或者pop
class _PrivateRouter {
  static Router router = Router();  
}
