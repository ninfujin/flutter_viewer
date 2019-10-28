import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoCommentState> buildEffect() {
  return combineEffects(<Object, Effect<VideoCommentState>>{
    VideoCommentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VideoCommentState> ctx) {
}
