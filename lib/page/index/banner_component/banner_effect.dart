import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.action: _onAction,
    BannerAction.toWebView: _onToWebView,
    BannerAction.toLogin: _onToLogin,
    Lifecycle.build: _onInitState,
  });
}

void _onAction(Action action, Context<BannerState> ctx) {}

void _onInitState(Action action, Context<BannerState> ctx) {

  ctx.dispatch(BannerActionCreator.onUpdatePoint(199999));
}

void _onToWebView(Action action, Context<BannerState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  Navigator.pushNamed(ctx.context, "webView",
      arguments: {"url": url, "title": title});
}

void _onToLogin(Action action, Context<BannerState> ctx) {
  Navigator.pushNamed(ctx.context, "login", arguments: null);
}
