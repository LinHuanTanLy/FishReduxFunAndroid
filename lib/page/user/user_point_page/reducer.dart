import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserPointState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPointState>>{
      UserPointAction.action: _onAction,
      UserPointAction.updateUserPoint: _onUpdateUserPoint,
      UserPointAction.updatePointList: _onUpdateUserPointList,
    },
  );
}

UserPointState _onAction(UserPointState state, Action action) {
  final UserPointState newState = state.clone();
  return newState;
}

UserPointState _onUpdateUserPoint(UserPointState state, Action action) {
  final UserPointState newState = state.clone();
  UserPointBean _bean = action.payload;
  return newState..userPointBean = _bean;
}

UserPointState _onUpdateUserPointList(UserPointState state, Action action) {
  final UserPointState newState = state.clone();
  List<UserPointCell> _bean = action.payload;
  return newState..pointCell = _bean;
}
