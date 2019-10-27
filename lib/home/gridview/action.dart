import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/models/travel_model.dart';

enum WaterFallGridViewAction {
  initState,
  dispose,
  assembleData,
  startRequest,
  refreshTimer,
  tapGridViewItem,
  scrollToTop,
}

class WaterFallGridViewActionCreator {
  static Action onInitState() {
    return const Action(WaterFallGridViewAction.initState);
  }

  static Action onDispose() {
    return const Action(WaterFallGridViewAction.dispose);
  }

  static Action onAssembleData(List<Article> articles) {
    return Action(WaterFallGridViewAction.assembleData, payload: articles);
  }

  static Action onStartRequest({bool isLoadMore = true}) {
    return Action(WaterFallGridViewAction.startRequest, payload: isLoadMore);
  }

  static Action onRefreshTimer() {
    return const Action(WaterFallGridViewAction.refreshTimer);
  }

  static Action onTapGridViewItem(int idx) {
    return Action(WaterFallGridViewAction.tapGridViewItem, payload: idx);
  }

  static Action onScrollToTop() {
    return const Action(WaterFallGridViewAction.scrollToTop);
  }

  static Action onTapGridItem() {
    return const Action(WaterFallGridViewAction.tapGridViewItem);
  }
}
