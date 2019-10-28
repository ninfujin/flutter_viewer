import 'package:fish_redux/fish_redux.dart';
import '../video_play/action.dart';
import 'state.dart';

Effect<VideoPlayState> buildEffect() {
  return combineEffects(<Object, Effect<VideoPlayState>>{
    VideoPlayAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VideoPlayState> ctx) {
}
