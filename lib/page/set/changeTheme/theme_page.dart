import 'package:fish_redux/fish_redux.dart';

import 'theme_effect.dart';
import 'theme_reducer.dart';
import 'theme_state.dart';
import 'theme_view.dart';

class ThemeChangePage extends Page<ThemeChangeState, Map<String, dynamic>> {
  ThemeChangePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ThemeChangeState>(
                adapter: null,
                slots: <String, Dependent<ThemeChangeState>>{
                }),
            middleware: <Middleware<ThemeChangeState>>[
            ],);

}
