import 'package:fish_redux/fish_redux.dart';

import 'login_effect.dart';
import 'login_reducer.dart';
import 'login_state.dart';
import 'login_view.dart';

class LoginPage extends Page<loginState, Map<String, dynamic>> {
  LoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<loginState>(
                adapter: null,
                slots: <String, Dependent<loginState>>{
                }),
            middleware: <Middleware<loginState>>[
            ],);

}
