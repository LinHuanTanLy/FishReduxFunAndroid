import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserRankBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'user_rank_action.dart';
import 'user_rank_state.dart';

Effect<UserRankState> buildEffect() {
  return combineEffects(<Object, Effect<UserRankState>>{
    UserRankAction.action: _onAction,
    UserRankAction.refresh: _onRefresh,
    UserRankAction.loadMore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<UserRankState> ctx) {}

void _onRefresh(Action action, Context<UserRankState> ctx) {
  ctx.state.pageNum = 1;
  _onInitState(action, ctx);
}

void _onLoadMore(Action action, Context<UserRankState> ctx) {
  _onInitState(action, ctx);
}

void _onInitState(Action action, Context<UserRankState> ctx) {
  int pageNum = ctx.state.pageNum;
  _requestRankList(action, ctx, pageNum);
}

/// 请求排名数据
_requestRankList(Action action, Context<UserRankState> ctx, int pageNum) {
  DioUtils.getInstance().doGet('coin/rank/$pageNum/json', (data) {
    UserRankBean _bean = UserRankBean.fromJson(data);
    ctx.dispatch(UserRankActionCreator.onUpdateRankList(_bean?.data?.datas));
  });
}
