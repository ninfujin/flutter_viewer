import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/home/gridview/page.dart';
import 'package:flutter_viewer/home/page.dart';

class FishReduxPageRoute {
  static FishReduxPageRoute get instance => _sharedInstance();
  static AbstractRoutes get routes => PageRoutes(
    pages: {
      'flutter_viewer_home_page': HomePage(),
      'flutter_viewer_waterfall_grid_view': WaterFallGridViewPage()
    },
  );
  // 单例公开访问点
  factory FishReduxPageRoute() =>_sharedInstance();

  // 静态私有成员，没有初始化
  static FishReduxPageRoute _instance;

  // 私有构造函数
  FishReduxPageRoute._() {
    //
  }

  // 静态、同步、私有访问点
  static FishReduxPageRoute _sharedInstance() {
    if (_instance == null) {
      _instance = FishReduxPageRoute._();
    }
    return _instance;
  }
}