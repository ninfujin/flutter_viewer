import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WaterFallGridViewPage extends Page<WaterFallGridViewState, Map<String, dynamic>> {
  WaterFallGridViewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WaterFallGridViewState>(
                adapter: null,
                slots: <String, Dependent<WaterFallGridViewState>>{
                }),
            middleware: <Middleware<WaterFallGridViewState>>[
            ],);

}
