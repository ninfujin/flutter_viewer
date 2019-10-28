import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/pages/detail_view/video_play/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

import 'video_play/component.dart';
import 'video_info/component.dart';
import 'video_comment/component.dart';

class DetailViewPage extends Page<DetailViewState, Map<String, dynamic>> {
  DetailViewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DetailViewState>(
                adapter: null,
                slots: <String, Dependent<DetailViewState>>{
                  'flutter_viewer_video_play_component': VideoPlayConnector() + VideoPlayComponent(),
                  'flutter_viewer_video_info_component': VideoInfoConnector() + VideoInfoComponent(),
                  'flutter_viewer_video_comment_component': VideoCommentConnector() + VideoCommentComponent()
                }),
            middleware: <Middleware<DetailViewState>>[
            ],);

}
