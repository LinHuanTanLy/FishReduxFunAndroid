import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'project_action.dart';
import 'project_state.dart';

Effect<ProjectState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectState>>{
    ProjectAction.action: _onAction,
    Lifecycle.build: _onBuild,
  });
}

void _onAction(Action action, Context<ProjectState> ctx) {}

void _onBuild(Action action, Context<ProjectState> ctx) {
  double w = MediaQuery.of(ctx.context).size.width;
  ctx.dispatch(ProjectActionCreator.onInitW(w));
}
