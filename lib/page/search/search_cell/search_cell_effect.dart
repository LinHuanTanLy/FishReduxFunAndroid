import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'search_cell_action.dart';
import 'search_cell_state.dart';

Effect<SearchCellState> buildEffect() {
  return combineEffects(<Object, Effect<SearchCellState>>{
    SearchCellAction.action: _onAction,
    SearchCellAction.toWebView: _onToWebView,
  });
}

void _onAction(Action action, Context<SearchCellState> ctx) {}

void _onToWebView(Action action, Context<SearchCellState> ctx) {
  Navigator.pushNamed(
    ctx.context,
    "webView",
    arguments: {
      "url": ctx.state.cellBean?.link,
      "title": ctx.state.cellBean?.title,
      "id": ctx?.state?.cellBean?.id,
      "collect": ctx?.state?.cellBean?.collect
    },
  );
}
