import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoCommentComponent extends Component<VideoCommentState> {
  VideoCommentComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoCommentState>(
                adapter: null,
                slots: <String, Dependent<VideoCommentState>>{
                }),);

}
