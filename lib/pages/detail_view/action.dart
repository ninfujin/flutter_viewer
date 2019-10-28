import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailViewAction { pop, scroll }

class DetailViewActionCreator {
  static Action onPop() {
    return const Action(DetailViewAction.pop);
  }

  static Action onScroll(double scrollOffset) {
    return Action(DetailViewAction.scroll, payload: scrollOffset);
  }
}
