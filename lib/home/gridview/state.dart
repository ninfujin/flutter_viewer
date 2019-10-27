import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/models/travel_model.dart';

class WaterFallGridViewState implements Cloneable<WaterFallGridViewState> {

  ScrollController scrollController;
  List<Article> articleModels;
  int pageIndex;
  bool isLoading;
  bool isThrottling;
  Timer timer;
  int type;

  @override
  WaterFallGridViewState clone() {
    return WaterFallGridViewState()
      ..scrollController = scrollController
      ..articleModels = articleModels
      ..pageIndex = pageIndex
      ..isLoading = isLoading
      ..isThrottling = isThrottling
      ..timer = timer
      ..type = type;
  }
}

WaterFallGridViewState initState(Map<String, dynamic> args) {
  WaterFallGridViewState instanceState = WaterFallGridViewState();
  instanceState.pageIndex = 0;
  instanceState.isLoading = true;
  instanceState.type = args['type'];
  instanceState.articleModels = [];
  instanceState.scrollController = ScrollController();
  instanceState.isThrottling = true;
  return instanceState;
}
