import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailViewState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailViewState>>{
      DetailViewAction.scroll: _scroll
    },
  );
}

DetailViewState _scroll(DetailViewState state, Action action) {
  final DetailViewState newState = state.clone();
  newState.appBarAlpha = action.payload / 450.0;
  if(newState.appBarAlpha < 0) newState.appBarAlpha = 0.0;
  if(newState.appBarAlpha > 1.0) newState.appBarAlpha = 1.0;
  return newState;
}
