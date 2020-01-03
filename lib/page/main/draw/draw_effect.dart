import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'draw_action.dart';
import 'draw_state.dart';

Effect<DrawState> buildEffect() {
  return combineEffects(<Object, Effect<DrawState>>{
    DrawAction.action: _onAction,
    DrawAction.toChangeThemeColor: _onThemeChange,
    DrawAction.toSeeCredits: _onToCredits,
    DrawAction.toSeeRank: _onToRank,
    DrawAction.toAddArticleShare: _onToArticleShare,
    DrawAction.toAddWebShare: _onToWebShare,
    DrawAction.toLogout: _onLoginOut,
    DrawAction.toSeeAbout:_onAbout,
    DrawAction.toSeeEnv:_onSeeEnv,
  });
}

void _onAction(Action action, Context<DrawState> ctx) {}
void _onSeeEnv(Action action, Context<DrawState> ctx) {

}
void _onAbout(Action action, Context<DrawState> ctx) {
  Navigator.pushNamed(ctx.context, 'webView',arguments: {
    "title":"关于本项目",
    "url":"https://github.com/LinHuanTanLy/FishReduxFunAndroid"
  });
}

void _onLoginOut(Action action, Context<DrawState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLoginStatus(false));
}

void _onToCredits(Action action, Context<DrawState> ctx) {
  _pushNameWithLoginVerify(action, ctx, () {
    Navigator.pushNamed(ctx.context, 'user_point');
  });
}

void _onToArticleShare(Action action, Context<DrawState> ctx) {
  _pushNameWithLoginVerify(action, ctx, () {
    Navigator.pushNamed(ctx.context, 'article_collection',
        arguments: {"userName": '匿名'});
  });
}

void _onToWebShare(Action action, Context<DrawState> ctx) {
  _pushNameWithLoginVerify(action, ctx, () {
    Navigator.pushNamed(ctx.context, 'web_collection');
  });
}

void _onToRank(Action action, Context<DrawState> ctx) {
  _pushNameWithLoginVerify(action, ctx, () {
    Navigator.pushNamed(ctx.context, 'user_rank');
  });
}

void _onThemeChange(Action action, Context<DrawState> ctx) {
  Navigator.pushNamed(ctx.context, 'theme_change');
}

/// 校验登录后方可进行的操作
_pushNameWithLoginVerify(
    Action action, Context<DrawState> ctx, Function function) {
  if (ctx.state.ifLogin) {
    function();
  } else {
    ToastUtils.showTs('请先登录');
  }
}
