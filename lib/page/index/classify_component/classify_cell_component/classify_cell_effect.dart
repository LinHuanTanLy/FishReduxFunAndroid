import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'classify_cell_action.dart';
import 'classify_cell_state.dart';

Effect<ClassifyCellState> buildEffect() {
  return combineEffects(<Object, Effect<ClassifyCellState>>{
    ClassifyCellAction.action: _onAction,
    ClassifyCellAction.toAuthorPage: _onToAuthorPage,
  });
}

void _onAction(Action action, Context<ClassifyCellState> ctx) {}

void _onToAuthorPage(Action action, Context<ClassifyCellState> ctx) {
  Navigator.pushNamed(ctx.context, "wechat_author", arguments: {
    "id": action.payload,
  });
}
