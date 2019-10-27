import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_viewer/home/tabcontroller_stf.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
  });
}

void _onInitState(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TabControllerStf;
  ctx.state.controller = TabController(vsync: tickerProvider, length: ctx.state.tabBarModels.length, initialIndex: 1);
}

void _onDispose(Action action, Context<HomeState> ctx) {
  ctx.state.controller.dispose();
}
