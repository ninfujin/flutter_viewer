import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/home/page.dart';
import 'commom/global.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
      pages: {
        'flutter_viewer_home_page': HomePage()
      },
  );

  return MaterialApp(
      title: '快手',
      theme: GlobalConfig.defaultTheme,
      debugShowCheckedModeBanner: false,
      home: routes.buildPage('flutter_viewer_home_page', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      }
  );
}