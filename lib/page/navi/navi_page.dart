import 'package:fish_redux/fish_redux.dart';

import 'navi_effect.dart';
import 'navi_reducer.dart';
import 'navi_state.dart';
import 'navi_view.dart';

class NaviPage extends Page<NaviState, Map<String, dynamic>> {
  NaviPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NaviState>(
                adapter: null,
                slots: <String, Dependent<NaviState>>{
                }),
            middleware: <Middleware<NaviState>>[
            ],);

}
