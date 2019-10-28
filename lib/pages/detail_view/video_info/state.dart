import 'package:fish_redux/fish_redux.dart';

class VideoInfoState implements Cloneable<VideoInfoState> {

  @override
  VideoInfoState clone() {
    return VideoInfoState();
  }
}

VideoInfoState initState(Map<String, dynamic> args) {
  return VideoInfoState();
}
