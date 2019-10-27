import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WaterFallGridViewState> buildReducer() {
  return asReducer(
    <Object, Reducer<WaterFallGridViewState>>{
      WaterFallGridViewAction.refreshTimer: _refreshTimer,
      WaterFallGridViewAction.assembleData: _assembleData,
    },
  );
}

WaterFallGridViewState _refreshTimer(WaterFallGridViewState state, Action action) {
  final WaterFallGridViewState newState = state.clone();
  newState.canContinueLoad = false;
  if(null  != newState.timer) newState.timer.cancel();
  newState.timer = Timer(Duration(seconds: 1), (){
    newState.canContinueLoad = true;
  });
  return newState;
}

WaterFallGridViewState _assembleData(WaterFallGridViewState state, Action action) {
  final WaterFallGridViewState newState = state.clone();
  newState.articleModels.addAll(action.payload);
  newState.pageIndex++;
  newState.isLoading = false;
  return newState;
}