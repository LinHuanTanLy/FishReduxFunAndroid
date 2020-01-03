import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'article_action.dart';
import 'article_state.dart';

Effect<ArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCellState>>{
    ArticleCellAction.action: _onAction,
    ArticleCellAction.toWebView: _onToWebView,
  });
}

void _onAction(Action action, Context<ArticleCellState> ctx) {}

void _onToWebView(Action action, Context<ArticleCellState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  Navigator.pushNamed(ctx.context, "webView", arguments: {
    "url": url,
    "title": title,
    "id": ctx.state?.hotArticleCellBean?.id,
    "collect": ctx.state?.hotArticleCellBean?.collect
  });
}
