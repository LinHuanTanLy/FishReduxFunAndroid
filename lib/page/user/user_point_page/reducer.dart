import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserPointState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPointState>>{
      UserPointAction.action: _onAction,
    },
  );
}

UserPointState _onAction(UserPointState state, Action action) {
  final UserPointState newState = state.clone();
  return newState;
}
