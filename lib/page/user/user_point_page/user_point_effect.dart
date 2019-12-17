import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'user_point_action.dart';
import 'user_point_state.dart';

Effect<UserPointState> buildEffect() {
  return combineEffects(<Object, Effect<UserPointState>>{
    UserPointAction.action: _onAction,
    UserPointAction.refresh: _onRefresh,
    UserPointAction.loadmore: _onLoadMore,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<UserPointState> ctx) {}
void _onRefresh(Action action, Context<UserPointState> ctx) {
  ctx.state.pageNum=1;
  int pageNum = ctx.state.pageNum;
  _requestList(action, ctx, pageNum);
}

void _onLoadMore(Action action, Context<UserPointState> ctx) {
  int pageNum = ctx.state.pageNum;
  _requestList(action, ctx, pageNum);
}

void _onInit(Action action, Context<UserPointState> ctx) {
  int pageNum = ctx.state.pageNum;
  _requestUserInfo(action, ctx);
  _requestList(action, ctx, pageNum);
}

///请求用户数据
_requestUserInfo(Action action, Context<UserPointState> ctx) {
  DioUtils.getInstance().doGet('lg/coin/userinfo/json', (data) {
    UserPointBean _bean = UserPointBean.fromJson(data);
    ctx.dispatch(UserPointActionCreator.onUpdateUserPoint(_bean));
  }, error: (data) {
    ToastUtils.showTs(data);
  });
}

/// 请求列表数据
_requestList(Action action, Context<UserPointState> ctx, int pageNum) {
  DioUtils.getInstance().doGet('lg/coin/list/$pageNum/json', (data) {
    UserPointListBean _bean = UserPointListBean.fromJson(data);
    ctx.dispatch(
        UserPointActionCreator.onUpdatePointList(_bean?.data?.pointCell));
  });
}
