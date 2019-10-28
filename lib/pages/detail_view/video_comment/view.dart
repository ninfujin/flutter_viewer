import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(VideoCommentState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: List.generate(10, (idx) {
      return Container(
          color: Colors.green,
          height: scaleH(250),
          child: Center(child: Text('$idx')));
    }),
  );
}
