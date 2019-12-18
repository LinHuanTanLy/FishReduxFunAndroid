import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserRankBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'user_rank_action.dart';
import 'user_rank_state.dart';

Reducer<UserRankState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserRankState>>{
      UserRankAction.action: _onAction,
      UserRankAction.updateRankList: _onUpdateRankList,
    },
  );
}

UserRankState _onAction(UserRankState state, Action action) {
  final UserRankState newState = state.clone();
  return newState;
}

UserRankState _onUpdateRankList(UserRankState state, Action action) {
  final UserRankState newState = state.clone();
  List<UserCellRankBean> listForRank = action.payload;
  int pageNum = state.pageNum;
  if (pageNum == 1) {
    newState..listForRank = listForRank;
    state.refreshController.refreshCompleted();
  } else {
    List<UserCellRankBean> oldList = state.listForRank;
    oldList.addAll(listForRank);
    newState..listForRank = oldList;
    state.refreshController.loadComplete();
  }
  if (listForRank.isEmpty) {
    ToastUtils.showTs('没有更多数据了');
  }
  return newState..pageNum = ++pageNum;
}
