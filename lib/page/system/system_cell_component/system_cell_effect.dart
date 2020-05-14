import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'system_cell_action.dart';
import 'system_cell_state.dart';

Effect<SystemCellState> buildEffect() {
  return combineEffects(<Object, Effect<SystemCellState>>{
    SystemCellAction.action: _onAction,
    SystemCellAction.toSystemChild: _onToSystemChild,
  });
}

void _onAction(Action action, Context<SystemCellState> ctx) {}
void _onToSystemChild(Action action, Context<SystemCellState> ctx) {
  Navigator.pushNamed(ctx.context, 'system_child', arguments: action.payload);
}
