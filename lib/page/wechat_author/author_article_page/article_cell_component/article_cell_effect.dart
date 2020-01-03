import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'article_cell_action.dart';
import 'article_cell_state.dart';

Effect<ArticleAuthorCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleAuthorCellState>>{
    ArticleCellAction.action: _onAction,
    ArticleCellAction.toWebViewPage: _toWebViewPage,
  });
}

void _onAction(Action action, Context<ArticleAuthorCellState> ctx) {}

void _toWebViewPage(Action action, Context<ArticleAuthorCellState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  Navigator.pushNamed(ctx.context, "webView", arguments: {
    "url": url,
    "title": title,
    "id": ctx.state?.articleCellChildList?.id,
    "collect": ctx.state?.articleCellChildList?.collect
  });
}
