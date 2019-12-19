import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'navi_action.dart';
import 'navi_effect.dart';
import 'navi_reducer.dart';
import 'navi_state.dart';
import 'navi_view.dart';

Reducer<NaviState> buildReducer() {
  return asReducer(
    <Object, Reducer<NaviState>>{
      NaviAction.action: _onAction,
      NaviAction.updateNaviList: _onUpdateNaviList,
      NaviAction.clickLeftItem:_onClickLeftItem,
    },
  );
}

NaviState _onAction(NaviState state, Action action) {
  final NaviState newState = state.clone();
  return newState;
}
NaviState _onClickLeftItem(NaviState state, Action action) {
  final NaviState newState = state.clone();
  return newState..currIndex=action.payload;
}

NaviState _onUpdateNaviList(NaviState state, Action action) {
  final NaviState newState = state.clone();
  newState..listForNavi = action.payload;
  if (newState.listForNavi.isNotEmpty == true) {
    newState..currIndex = newState.listForNavi[0].cid;
  }
  return newState;
}
