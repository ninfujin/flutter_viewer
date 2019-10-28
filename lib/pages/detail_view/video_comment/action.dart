import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VideoCommentAction { action }

class VideoCommentActionCreator {
  static Action onAction() {
    return const Action(VideoCommentAction.action);
  }
}
