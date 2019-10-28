import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoCommentState>>{
      VideoCommentAction.action: _onAction,
    },
  );
}

VideoCommentState _onAction(VideoCommentState state, Action action) {
  final VideoCommentState newState = state.clone();
  return newState;
}
