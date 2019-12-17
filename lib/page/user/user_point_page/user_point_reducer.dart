import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'user_point_action.dart';
import 'user_point_state.dart';

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
  int pageNum = state.pageNum;
  if (pageNum == 1) {
    state.refreshController.refreshCompleted();
    return newState
      ..pointCell = _bean
      ..pageNum = ++pageNum;
  } else {
    List<UserPointCell> _tempList = state.pointCell.toList();
    _tempList.addAll(_bean);
    if (_bean != null && _bean.isNotEmpty == true) {
      state.refreshController.loadComplete();
    } else {
      state.refreshController.loadComplete();
      ToastUtils.showTs('没有更多数据了');
    }
    return newState
      ..pointCell = _tempList
      ..pageNum = ++pageNum;
  }
}
