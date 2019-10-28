import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoPlayComponent extends Component<VideoPlayState> {
  VideoPlayComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoPlayState>(
                adapter: null,
                slots: <String, Dependent<VideoPlayState>>{
                }),);

}
