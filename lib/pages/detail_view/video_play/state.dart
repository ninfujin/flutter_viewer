import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';

class VideoPlayState implements Cloneable<VideoPlayState> {

  ChewieController chewieController;
  Future inititalizeVideoPlayerFuture;

  @override
  VideoPlayState clone() {
    return VideoPlayState()
    ..chewieController = chewieController
    ..inititalizeVideoPlayerFuture = inititalizeVideoPlayerFuture;
  }
}

VideoPlayState initState(Map<String, dynamic> args) {
  VideoPlayState instanceState = VideoPlayState();
  return instanceState;
}
