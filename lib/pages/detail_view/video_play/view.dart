import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(VideoPlayState state, Dispatch dispatch, ViewService viewService) {
  return  Container(
    color: Colors.pinkAccent,
    height: scaleH(1700),
  );
}
