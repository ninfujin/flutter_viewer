import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoInfoComponent extends Component<VideoInfoState> {
  VideoInfoComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoInfoState>(
                adapter: null,
                slots: <String, Dependent<VideoInfoState>>{
                }),);

}
