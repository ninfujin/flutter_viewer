import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_viewer/home/tabcontroller_stf.dart';
import 'package:flutter_viewer/models/travel_model.dart';
import 'package:flutter_viewer/network/request_helper.dart';
import 'package:flutter_viewer/pages/home/detail_page.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onInitState,
    Lifecycle.dispose: _onDispose,
    HomeAction.startRequest: _onStartRequest,
    HomeAction.clickGridViewItem: _onClickGridViewItem,
    HomeAction.scrollToTop: _onScrollToTop,
    HomeAction.tapTabItem: _onTapTabItem
  });
}

void _onInitState(Action action, Context<HomeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as TabControllerStf;
  ctx.state.controller = TabController(vsync: tickerProvider, length: ctx.state.tabBarModels.length, initialIndex: 1);
  ctx.state.scrollController.addListener(() {
    if((ctx.state.scrollController.position.pixels + 160.0) >= ctx.state.scrollController.position.maxScrollExtent) {
      if(!ctx.state.isLoading && ctx.state.canContinueLoad) {
        ctx.dispatch(HomeActionCreator.onStartRequest());
        ctx.dispatch(HomeActionCreator.onRefreshTimer());
      }
    }
  });
  ctx.dispatch(HomeActionCreator.onStartRequest());
}

void _onStartRequest(Action action, Context<HomeState> ctx) {
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
      ctx.dispatch(HomeActionCreator.onAssembleData(articles));
  });
}

void _onDispose(Action action, Context<HomeState> ctx) {
  ctx.state.controller.dispose();
  ctx.state.scrollController.dispose();
  if(null != ctx.state.timer) {
    ctx.state.timer.cancel();
  }
}

void _onClickGridViewItem(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return DetailVideoPage('HeroAnimation${ctx.state.type}_Route_Detail_${(action.payload)}');
      }));
}

void _onTapTabItem(Action action, Context<HomeState> ctx) {
  ctx.state.type = action.payload;
  ctx.state.articleModels.clear();
  _onStartRequest(action, ctx);
}


void _onScrollToTop(Action action, Context<HomeState> ctx) {
  ctx.state.scrollController.animateTo(0.0, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
}
