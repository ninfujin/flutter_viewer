import 'package:fish_redux/fish_redux.dart';

class VideoCommentState implements Cloneable<VideoCommentState> {

  @override
  VideoCommentState clone() {
    return VideoCommentState();
  }
}

VideoCommentState initState(Map<String, dynamic> args) {
  return VideoCommentState();
}
