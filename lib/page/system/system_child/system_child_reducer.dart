import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemChildBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'system_child_action.dart';
import 'system_child_state.dart';

Reducer<SystemChildState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemChildState>>{
      SystemChildAction.action: _onAction,
      SystemChildAction.updateList: _onUpdateList,
    },
  );
}

SystemChildState _onAction(SystemChildState state, Action action) {
  final SystemChildState newState = state.clone();
  return newState;
}

SystemChildState _onUpdateList(SystemChildState state, Action action) {
  final SystemChildState newState = state.clone();
  int _pageNum = state.pageNum;
  List<SystemChildCellBean> _list = action.payload;
  if (_pageNum == 0) {
    newState..listForSystemArticle = _list;
    state.refreshController.refreshCompleted();
  } else {
    List<SystemChildCellBean> _tempList = state.listForSystemArticle;
    if (_list.isEmpty == true) {
      ToastUtils.showTs('没有更多数据');
    }
    _tempList.addAll(_list);
    newState..listForSystemArticle = _tempList;
    state.refreshController.loadComplete();
  }

  return newState..pageNum = ++state.pageNum;
}
