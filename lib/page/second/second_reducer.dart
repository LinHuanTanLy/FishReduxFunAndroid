import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';

import 'second_action.dart';
import 'second_state.dart';

Reducer<SecondState> buildReducer() {
  return asReducer(
    <Object, Reducer<SecondState>>{
      SecondAction.action: _onAction,
      SecondAction.getUserInfo: _onGetUserInfo,
      SecondAction.getTodoMenu: _onGetTodoMenuList,
    },
  );
}

SecondState _onAction(SecondState state, Action action) {
  final SecondState newState = state.clone();
  return newState;
}

SecondState _onGetTodoMenuList(SecondState state, Action action) {
  final SecondState newState = state.clone();
  return newState..listForTodoMenu=action.payload;
}

SecondState _onGetUserInfo(SecondState state, Action action) {
  final SecondState newState = state.clone();
  UserPointBean _userBean = action.payload;
  return newState..userBean = _userBean;
}
