import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/user_point_page/user_point_state.dart';

import 'point_list_action.dart';

Reducer<UserPointState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPointState>>{
      PointListAction.action: _onAction,
    },
  );
}

UserPointState _onAction(UserPointState state, Action action) {
  final UserPointState newState = state.clone();
  return newState;
}
