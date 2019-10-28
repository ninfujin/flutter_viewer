import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'tabcontroller_stf.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {

  @override
  TabControllerStf createState() => TabControllerStf();

  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}
