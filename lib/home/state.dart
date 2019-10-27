import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/tabbar_config_model.dart';
import 'package:flutter_viewer/commom/tabbar_configer.dart';
import 'package:flutter_viewer/models/travel_model.dart';

class HomeState implements Cloneable<HomeState> {

  TabController controller;
  List<TabConfigModel> tabBarModels;
  int tabIndex;
  ScrollController scrollController;
  List<Article> articleModels;
  int pageIndex;
  bool isLoading;
  bool canContinueLoad;
  Timer timer;
  int type;

  @override
  HomeState clone() {
    return HomeState()
    ..controller = controller
    ..tabBarModels = tabBarModels
    ..tabIndex = tabIndex
    ..scrollController = scrollController
    ..articleModels = articleModels
    ..pageIndex = pageIndex
    ..isLoading = isLoading
    ..canContinueLoad = canContinueLoad
    ..timer = timer
    ..type = type;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState instanceState = HomeState();
  instanceState.tabBarModels = TabBarConfiger.generateTabConfigModels;
  instanceState.pageIndex = 0;
  instanceState.isLoading = true;
  instanceState.type = 1;
  instanceState.articleModels = [];
  instanceState.scrollController = ScrollController();
  instanceState.canContinueLoad = false;
  return instanceState;
}
