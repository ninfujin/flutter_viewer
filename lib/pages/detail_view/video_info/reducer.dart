import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoInfoState>>{
      VideoInfoAction.action: _onAction,
    },
  );
}

VideoInfoState _onAction(VideoInfoState state, Action action) {
  final VideoInfoState newState = state.clone();
  return newState;
}
