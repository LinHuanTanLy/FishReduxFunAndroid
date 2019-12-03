import 'package:fish_redux/fish_redux.dart';

import 'main_effect.dart';
import 'main_reducer.dart';
import 'main_state.dart';
import 'main_view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainState>(
              adapter: null,
              slots: <String, Dependent<MainState>>{
              }),
          middleware: <Middleware<MainState>>[],
        );
}
