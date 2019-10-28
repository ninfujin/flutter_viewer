import 'package:flutter/material.dart';
import 'commom/global.dart';
import 'commom/page_route.dart';

Widget createApp() {
  return MaterialApp(
      title: '快手',
      theme: GlobalConfig.defaultTheme,
      debugShowCheckedModeBanner: false,
      home: FishReduxPageRoute.routes.buildPage('flutter_viewer_home_page', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return FishReduxPageRoute.routes.buildPage(settings.name, settings.arguments);
        });
      }
  );
}