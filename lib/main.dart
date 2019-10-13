import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'package:flutter_viewer/commom/global.dart';

void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: GlobalConfig.defaultTheme,
      debugShowCheckedModeBanner: false
    );
  }
}

