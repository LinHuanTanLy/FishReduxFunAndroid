import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'action.dart';
import 'state.dart';

Effect<UserPointState> buildEffect() {
  return combineEffects(<Object, Effect<UserPointState>>{
    UserPointAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<UserPointState> ctx) {}

void _onInit(Action action, Context<UserPointState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as StateWithTickerProvider;
  ctx.state.tabController =
      TabController(length: ctx.state.menuList.length, vsync: tickerProvider);

  DioUtils.getInstance().doGet('lg/coin/userinfo/json', (data) {
    UserPointBean _bean = UserPointBean.fromJson(data);
    ctx.dispatch(UserPointActionCreator.onUpdateUserPoint(_bean));
  }, error: (data) {
    ToastUtils.showTs(data);
  });

  DioUtils.getInstance().doGet('lg/coin/list/1/json', (data) {
    UserPointListBean _bean = UserPointListBean.fromJson(data);
    ctx.dispatch(
        UserPointActionCreator.onUpdatePointList(_bean?.data?.pointCell));
  });
}
