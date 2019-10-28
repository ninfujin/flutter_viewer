import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/tabbar_config_model.dart';
import 'package:flutter_viewer/commom/tabbar_configer.dart';

class HomeState implements Cloneable<HomeState> {

  TabController controller;
  List<TabConfigModel> tabBarModels;
  int tabIndex;

  @override
  HomeState clone() {
    return HomeState()
    ..controller = controller
    ..tabBarModels = tabBarModels
    ..tabIndex = tabIndex;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState instanceState = HomeState();
  instanceState.tabBarModels = TabBarConfiger.generateTabConfigModels;
  return instanceState;
}
