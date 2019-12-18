import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'coll_cell_action.dart';
import 'coll_cell_state.dart';

Effect<ArticleCollCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCollCellState>>{
    ArticleCollCellAction.action: _onAction,
    ArticleCollCellAction.toWebView: _toWebView,
  });
}

void _onAction(Action action, Context<ArticleCollCellState> ctx) {}

void _toWebView(Action action, Context<ArticleCollCellState> ctx) {
  Navigator.pushNamed(ctx.context, "webView", arguments: {
    "url": ctx?.state?.articleCollCellBean?.link,
    "title": ctx?.state?.articleCollCellBean?.title
  });
}
