import 'package:fish_redux/fish_redux.dart';

import 'login_action.dart';
import 'login_state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}
