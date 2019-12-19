import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemChildBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'system_child_action.dart';
import 'system_child_state.dart';

Effect<SystemChildState> buildEffect() {
  return combineEffects(<Object, Effect<SystemChildState>>{
    SystemChildAction.action: _onAction,
    SystemChildAction.refresh: _onRefresh,
    SystemChildAction.loadMore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<SystemChildState> ctx) {}
void _onInitState(Action action, Context<SystemChildState> ctx) {
  _requestArticleList(action, ctx);
}

void _onRefresh(Action action, Context<SystemChildState> ctx) {
  ctx.state.pageNum = 0;
  _requestArticleList(action, ctx);
}

void _onLoadMore(Action action, Context<SystemChildState> ctx) {
  _requestArticleList(action, ctx);
}

_requestArticleList(Action action, Context<SystemChildState> ctx) {
  int pageNum = ctx.state.pageNum;
  int id = ctx.state.id;
  DioUtils.getInstance().doGet('article/list/$pageNum/json?cid=$id', (data) {
    SystemChildBean _bean = SystemChildBean.fromJson(data);
    ctx.dispatch(SystemChildActionCreator.onUpdateList(_bean?.data?.datas));
  });
}
