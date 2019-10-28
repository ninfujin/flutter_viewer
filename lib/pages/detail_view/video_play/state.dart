import 'package:fish_redux/fish_redux.dart';

class VideoPlayState implements Cloneable<VideoPlayState> {

  @override
  VideoPlayState clone() {
    return VideoPlayState();
  }
}

VideoPlayState initState(Map<String, dynamic> args) {
  return VideoPlayState();
}
