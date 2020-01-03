import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'web_action.dart';
import 'web_state.dart';
import 'package:share/share.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

Effect<WebLoadState> buildEffect() {
  return combineEffects(<Object, Effect<WebLoadState>>{
    WebLoadAction.action: _onAction,
    WebLoadAction.toShare: _onToShare,
    WebLoadAction.goBack: _onGoBack,
    WebLoadAction.goForward: _onForward,
    WebLoadAction.goRefresh: _onRefresh,
    WebLoadAction.goLike: _onLike,
  });
}

void _onAction(Action action, Context<WebLoadState> ctx) {}

void _onGoBack(Action action, Context<WebLoadState> ctx) {
  ctx.state.flutterWebViewPlugin.canGoBack().then((data) {
    if (data) {
      ctx.state.flutterWebViewPlugin.goBack();
    } else {
      Navigator.pop(ctx.context, ctx.state.ifCollect);
    }
  });
}

void _onForward(Action action, Context<WebLoadState> ctx) {
  ctx.state.flutterWebViewPlugin.canGoForward().then((data) {
    ctx.state.flutterWebViewPlugin.goForward();
  });
}

void _onRefresh(Action action, Context<WebLoadState> ctx) {
  ctx.state.flutterWebViewPlugin.reload();
}

void _onLike(Action action, Context<WebLoadState> ctx) {
  if (ctx.state.ifCollect) {
    _requestUnLickArticle(action, ctx);
  } else {
    _requestLickArticle(action, ctx);
  }
}

void _onToShare(Action action, Context<WebLoadState> ctx) {
  Share.share('嘿，小伙子，这个文章：[${ctx.state?.title}]不错哦，介绍你看看：${ctx.state.url}');
}

/// 收藏文章
_requestLickArticle(Action action, Context<WebLoadState> ctx) {
  DioUtils.getInstance().doPost('lg/collect/${ctx.state.id}/json', (data) {
    ctx.dispatch(WebLoadActionCreator.onUpdateCollectStatus(true));
  }, error: (data) {});
}

/// 取消收藏文章
_requestUnLickArticle(Action action, Context<WebLoadState> ctx) {
  DioUtils.getInstance().doPost('lg/uncollect_originId/${ctx.state.id}/json',
      (data) {
    ctx.dispatch(WebLoadActionCreator.onUpdateCollectStatus(false));
  }, error: (data) {});
}
