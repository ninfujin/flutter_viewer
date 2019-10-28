import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_viewer/models/travel_model.dart';
import 'package:flutter_viewer/network/request_helper.dart';
import 'action.dart';
import 'state.dart';
import '../../../commom/page_route.dart';

Effect<WaterFallGridViewState> buildEffect() {
  return combineEffects(<Object, Effect<WaterFallGridViewState>>{
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
    WaterFallGridViewAction.startRequest: _onStartRequest,
    WaterFallGridViewAction.tapGridViewItem: _onTapGridViewItem,
    WaterFallGridViewAction.scrollToTop: _onScrollToTop,
  });
}


void _onInitState(Action action, Context<WaterFallGridViewState> ctx) {
  ctx.state.scrollController.addListener(() {
    if((ctx.state.scrollController.position.pixels + 160.0) >= ctx.state.scrollController.position.maxScrollExtent) {
      if(!ctx.state.isLoading && ctx.state.isThrottling) {
        ctx.dispatch(WaterFallGridViewActionCreator.onStartRequest());
        ctx.dispatch(WaterFallGridViewActionCreator.onRefreshTimer(isThrottling: false));
        ctx.state.timer = Timer(Duration(seconds: 1), () {
          ctx.dispatch(WaterFallGridViewActionCreator.onRefreshTimer(isThrottling: true));
        });
      }
    }
  });
  ctx.dispatch(WaterFallGridViewActionCreator.onStartRequest());
}


void _onStartRequest(Action action, Context<WaterFallGridViewState> ctx) {
// 网络请求
  if (false == action.payload) {
    ctx.state.pageIndex = 0;
    ctx.state.articleModels.clear();
  }
  int pageSize = (0 == ctx.state.articleModels?.length || 10 > ctx.state.articleModels?.length) ? 10 : 4;
  Map groupChannelCodeInfo = {
    0 : 'tourphoto_global1',
    1 : 'RX-OMF',
    2 : 'quanliyouxi'
  };
  HttpRequestHelper.getTravelItemData(TRAVEL_URL, {
    'pageIndex': ctx.state.pageIndex,
    'pageSize': pageSize,
    'groupChannelCode': groupChannelCodeInfo[ctx.state.type]}).then((TravelItemModel val) {
    List<Article> articles = val.resultList.map((item) => item.article).toList();
    ctx.dispatch(WaterFallGridViewActionCreator.onAssembleData(articles));
  });
}

void _onDispose(Action action, Context<WaterFallGridViewState> ctx) {
  ctx.state.scrollController.dispose();
  if(null != ctx.state.timer) {
    ctx.state.timer.cancel();
  }
}

void _onTapGridViewItem(Action action, Context<WaterFallGridViewState> ctx) {
  Navigator.of(ctx.context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return FishReduxPageRoute.routes.buildPage(
            'flutter_viewer_detail_video_page',
            {
              'hero_animation_tag':'HeroAnimation${ctx.state.type}_Route_Detail_${(action.payload)}'
            });
      }));
}

void _onScrollToTop(Action action, Context<WaterFallGridViewState> ctx) {
  ctx.state.scrollController.animateTo(0.0, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
}