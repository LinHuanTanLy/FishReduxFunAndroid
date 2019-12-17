import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'second_action.dart';
import 'second_state.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    SecondAction.action: _onAction,
    SecondAction.toArticleCollection: _onToArticleCollection,
    SecondAction.toSeeCredits: _onToSeeCredits,
    SecondAction.toSeeRank: _onToSeeRank,
    SecondAction.toSeeShare: _onToSeeShare,
    SecondAction.toWebCollection: _onToWebCollection,
    SecondAction.toArticleCollection: _onToArticleCollection,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<SecondState> ctx) {}
void _onToArticleCollection(Action action, Context<SecondState> ctx) {}
void _onToSeeCredits(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'user_point');
}

void _onToSeeRank(Action action, Context<SecondState> ctx) {}
void _onToSeeShare(Action action, Context<SecondState> ctx) {}
void _onToWebCollection(Action action, Context<SecondState> ctx) {}

void _onInitState(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin != null && ctx.state.ifLogin)
    DioUtils.getInstance().doGet('lg/coin/userinfo/json', (data) {
      UserPointBean _bean = UserPointBean.fromJson(data);
      println('_bean is ${_bean.data.coinCount}');
      ctx.dispatch(SecondActionCreator.onGetUserInfo(_bean));
      if (_bean?.data?.coinCount != ctx.state.userPoint)
        GlobalStore.store.dispatch(
            GlobalActionCreator.onUpdateUserPoint(_bean?.data?.coinCount));
    }, error: (data) {
      ToastUtils.showTs(data);
    });
}
