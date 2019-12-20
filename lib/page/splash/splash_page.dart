import 'package:fish_redux/fish_redux.dart';

import 'splash_effect.dart';
import 'splash_reducer.dart';
import 'splash_state.dart';
import 'splash_view.dart';

class SplashPage extends Page<SplashState, Map<String, dynamic>> {
  SplashPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SplashState>(
                adapter: null,
                slots: <String, Dependent<SplashState>>{
                }),
            middleware: <Middleware<SplashState>>[
            ],);

}
