import 'package:fish_redux/fish_redux.dart';

import 'register_action.dart';
import 'register_state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.action: _onAction,
    },
  );
}

RegisterState _onAction(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  return newState;
}
