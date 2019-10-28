import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/pages/detail_view/video_comment/state.dart';
import 'package:flutter_viewer/pages/detail_view/video_info/state.dart';
import 'package:flutter_viewer/pages/detail_view/video_play/state.dart';

class DetailViewState implements Cloneable<DetailViewState> {

  Object heroTag;
  double appBarAlpha;

  @override
  DetailViewState clone() {
    return DetailViewState()
    ..heroTag = heroTag
    ..appBarAlpha = appBarAlpha;
  }
}

DetailViewState initState(Map<String, dynamic> args) {
  return DetailViewState()
  ..appBarAlpha = 0.0
  ..heroTag = args['hero_animation_tag'];
}

class VideoPlayConnector
    extends ConnOp<DetailViewState, VideoPlayState> {
  @override
  VideoPlayState get(DetailViewState state) {
    // TODO: implement get
//    return state.leftState;
  }

  @override
  void set(DetailViewState state, VideoPlayState subState) {
    // TODO: implement set
//    state.leftState = subState;
  }
}

class VideoInfoConnector
    extends ConnOp<DetailViewState, VideoInfoState> {
  @override
  VideoInfoState get(DetailViewState state) {
    // TODO: implement get
//    return state.rightState;
  }

  @override
  void set(DetailViewState state, VideoInfoState subState) {
    // TODO: implement set
//    state.rightState = subState;
  }
}

class VideoCommentConnector
    extends ConnOp<DetailViewState, VideoCommentState> {
  @override
  VideoCommentState get(DetailViewState state) {
    // TODO: implement get
//    return state.rightState;
  }

  @override
  void set(DetailViewState state, VideoCommentState subState) {
    // TODO: implement set
//    state.rightState = subState;
  }
}