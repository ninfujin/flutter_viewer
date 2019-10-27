import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.refreshTimer: _refreshTimer,
      HomeAction.assembleData: _assembleData,
    },
  );
}

HomeState _refreshTimer(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.canContinueLoad = false;
  if(null  != newState.timer) newState.timer.cancel();
  newState.timer = Timer(Duration(seconds: 1), (){
    newState.canContinueLoad = true;
  });
  return newState;
}

HomeState _assembleData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.articleModels.addAll(action.payload);
  newState.pageIndex++;
  newState.isLoading = false;
  return newState;
}

