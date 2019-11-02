import 'package:fish_redux/fish_redux.dart';
import '../video_play/action.dart';
import 'state.dart';

Effect<VideoPlayState> buildEffect() {
  return combineEffects(<Object, Effect<VideoPlayState>>{
    Lifecycle.disappear: _disappear,
    VideoPlayAction.action: _onAction,
  });
}

void _disappear(Action action, Context<VideoPlayState> ctx) {
  ctx.state.chewieController.videoPlayerController.pause();
}


void _onAction(Action action, Context<VideoPlayState> ctx) {
}
