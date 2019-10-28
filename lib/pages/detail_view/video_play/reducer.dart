import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoPlayState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoPlayState>>{
      VideoPlayAction.action: _onAction,
    },
  );
}

VideoPlayState _onAction(VideoPlayState state, Action action) {
  final VideoPlayState newState = state.clone();
  return newState;
}
