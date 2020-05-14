import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'comm_article_cell_action.dart';
import 'comm_article_cell_state.dart';

Effect<CommArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<CommArticleCellState>>{
    CommArticleCellAction.action: _onAction,
    CommArticleCellAction.toWebView: _onToWebView,
  });
}

void _onAction(Action action, Context<CommArticleCellState> ctx) {}
void _onToWebView(Action action, Context<CommArticleCellState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  Navigator.pushNamed(ctx.context, "webView",
      arguments: {"url": url, "title": title,    "id": ctx.state?.cellBean?.id,
        "collect": ctx.state?.cellBean?.collect});
}
