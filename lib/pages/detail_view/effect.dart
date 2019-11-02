import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Effect<DetailViewState> buildEffect() {
  return combineEffects(<Object, Effect<DetailViewState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    DetailViewAction.pop: _onPop,
  });
}

void _initState(Action action, Context<DetailViewState> ctx) {
  _setupVideoConfiguration(ctx);
}

void _dispose(Action action, Context<DetailViewState> ctx) {
  ctx.state.chewieController.videoPlayerController.dispose();
  ctx.state.chewieController.dispose();
}

void _onPop(Action action, Context<DetailViewState> ctx) {
  Navigator.pop(ctx.context);
}

/// #pragma mark - private

void _setupVideoConfiguration(Context<DetailViewState> ctx) {
  VideoPlayerController videoPlayerControllerontroller = VideoPlayerController.asset('videos/test.mp4');
  Future inititalizeVideoPlayerFuture = videoPlayerControllerontroller.initialize();
  videoPlayerControllerontroller.setLooping(true);
  ChewieController chewieController = ChewieController(
    videoPlayerController: videoPlayerControllerontroller,
    aspectRatio: kScreenWidth / (0.85 * kScreenHeight),
    autoPlay: !true,
    looping: true,
    showControls: true,
    autoInitialize: !true,
    materialProgressColors: ChewieProgressColors(
      playedColor: Colors.blue,
      handleColor: Colors.orange,
      backgroundColor: Colors.white70,
      bufferedColor: Colors.grey,
    ),
  );
  ctx.dispatch(DetailViewActionCreator.onUpdateVideoConfiguration({
    'controller': chewieController,
    'future': inititalizeVideoPlayerFuture
  }));
}
