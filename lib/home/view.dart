import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/global.dart';
import 'package:flutter_viewer/commom/page_route.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/commom/tabbar_configer.dart';
import 'package:flutter_viewer/home/gridview/keep_alive_wraper.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  initialScreenUtil( viewService.context, w: 1080, h: 2248);
  return Scaffold(
    appBar: _appBar(state, dispatch),
    body: TabBarView(
      controller: state.controller,
      children: state.tabBarModels.map((model) {
        return KeepAliverWraper(
          child: FishReduxPageRoute.routes.buildPage(
              'flutter_viewer_waterfall_grid_view',
              {'type': state.tabBarModels.indexOf(model)}
          )
        );
      }).toList(),
    ),
  );
}

_appBar(HomeState state, Dispatch dispatch) {
  return AppBar(
      backgroundColor: GlobalConfig.defaultTheme.primaryColor,
      elevation: 0,
      title: TabBar(
        controller: state.controller,
        unselectedLabelColor: UNSELECTED_LABEL_COLOR,
        unselectedLabelStyle: UNSELECTED_LABEL_STYLE,
        labelColor: LABEL_COLOR,
        labelStyle: LABEL_STYLE,
        indicatorPadding: INDICATOR_PADDING,
        indicatorColor: INDICATOR_COLOR,
        tabs: state.tabBarModels.map((model) {
          return Tab(text: model.title);
        }).toList(),
      ),
      leading: GestureDetector(
          child: Icon(Icons.menu, color: UNSELECTED_LABEL_COLOR)),
      actions: <Widget>[
        GestureDetector(
            child: Icon(Icons.camera_alt, color: UNSELECTED_LABEL_COLOR)),
        SizedBox(width: scaleW(45.0))
      ]
  );
}