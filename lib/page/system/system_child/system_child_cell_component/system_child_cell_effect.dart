import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'system_child_cell_action.dart';
import 'system_child_cell_state.dart';

Effect<SystemChildCellState> buildEffect() {
  return combineEffects(<Object, Effect<SystemChildCellState>>{
    SystemChildCellAction.action: _onAction,
    SystemChildCellAction.toWebView: _onToWebView,
  });
}

void _onAction(Action action, Context<SystemChildCellState> ctx) {}
void _onToWebView(Action action, Context<SystemChildCellState> ctx) {
  Navigator.pushNamed(ctx.context, 'webView', arguments: {
    "url": ctx?.state?.systemChildCellBean?.link,
    "title": ctx?.state?.systemChildCellBean?.title
  });
}
