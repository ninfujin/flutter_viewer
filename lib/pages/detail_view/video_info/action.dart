import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VideoInfoAction { action }

class VideoInfoActionCreator {
  static Action onAction() {
    return const Action(VideoInfoAction.action);
  }
}
