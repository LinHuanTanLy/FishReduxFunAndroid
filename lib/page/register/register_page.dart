import 'package:fish_redux/fish_redux.dart';

import 'register_effect.dart';
import 'register_reducer.dart';
import 'register_state.dart';
import 'register_view.dart';

class RegisterPage extends Page<RegisterState, Map<String, dynamic>> {
  RegisterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RegisterState>(
                adapter: null,
                slots: <String, Dependent<RegisterState>>{
                }),
            middleware: <Middleware<RegisterState>>[
            ],);

}
