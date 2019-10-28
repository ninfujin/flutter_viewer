import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DetailViewState> buildEffect() {
  return combineEffects(<Object, Effect<DetailViewState>>{
    DetailViewAction.pop: _onPop,
  });
}

void _onPop(Action action, Context<DetailViewState> ctx) {
  Navigator.pop(ctx.context);
}
