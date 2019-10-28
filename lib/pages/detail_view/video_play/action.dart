import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VideoPlayAction { action }

class VideoPlayActionCreator {
  static Action onAction() {
    return const Action(VideoPlayAction.action);
  }
}
