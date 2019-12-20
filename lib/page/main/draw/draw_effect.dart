import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'draw_action.dart';
import 'draw_state.dart';

Effect<DrawState> buildEffect() {
  return combineEffects(<Object, Effect<DrawState>>{
    DrawAction.action: _onAction,
    DrawAction.toChangeThemeColor: _onThemeChange,
  });
}

void _onAction(Action action, Context<DrawState> ctx) {}

void _onThemeChange(Action action, Context<DrawState> ctx) {
  Navigator.pushNamed(ctx.context, 'theme_change');
}
