import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/models/travel_model.dart';

enum HomeAction {
  initState,
  dispose,
  assembleData,
  startRequest,
  refreshTimer,
  clickGridViewItem,
  scrollToTop,
  tapTabItem
}

class HomeActionCreator {
  static Action onInitState() {
    return const Action(HomeAction.initState);
  }

  static Action onDispose() {
    return const Action(HomeAction.dispose);
  }

  static Action onAssembleData(List<Article> articles) {
    return Action(HomeAction.assembleData, payload: articles);
  }

  static Action onStartRequest({bool isLoadMore = true}) {
    return Action(HomeAction.startRequest, payload: isLoadMore);
  }

  static Action onRefreshTimer() {
    return const Action(HomeAction.refreshTimer);
  }

  static Action onClickGridViewItem(int idx) {
    return Action(HomeAction.clickGridViewItem, payload: idx);
  }

  static Action onScrollToTop() {
    return const Action(HomeAction.scrollToTop);
  }

  static Action onTapTabItem(int tabIndex) {
    return Action(HomeAction.tapTabItem, payload: tabIndex);
  }
}
