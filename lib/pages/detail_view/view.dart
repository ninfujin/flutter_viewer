import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DetailViewState state, Dispatch dispatch, ViewService viewService) {
  return Hero(
    tag: state.heroTag,
    child: GestureDetector(
        onHorizontalDragEnd: (e) => dispatch(DetailViewActionCreator.onPop()),
        child: Scaffold(
          body:  SafeArea(
            child: Container(
              color: Colors.blueGrey,
              child: Stack(
                children: <Widget>[
                  _content(state, dispatch, viewService),
                  _customAppBar(state)
                ],
              ),
            ),
          ),
        )
    ),
  );
}

Widget _content(DetailViewState state, Dispatch dispatch, ViewService viewService) {

  return NotificationListener(
      onNotification: (scrollNorification) {
        if(scrollNorification is ScrollUpdateNotification
            && scrollNorification.depth == 0) {
          dispatch(DetailViewActionCreator.onScroll(scrollNorification.metrics.pixels));
        }
        return true;
      },
      child:ListView(
        children: <Widget>[
          viewService.buildComponent('flutter_viewer_video_play_component'),
          viewService.buildComponent('flutter_viewer_video_info_component'),
          viewService.buildComponent('flutter_viewer_video_comment_component')
        ],
      ));
}

Widget _customAppBar(DetailViewState state) {
  return Opacity(
      opacity: state.appBarAlpha,
      child: Container(
        height: scaleH(160),
        color: Colors.white,
      )
  );
}
