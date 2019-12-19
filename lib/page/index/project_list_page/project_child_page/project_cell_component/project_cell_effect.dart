import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'project_cell_action.dart';
import 'project_cell_state.dart';

Effect<ProjectCellState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectCellState>>{
    ProjectCellAction.action: _onAction,
    ProjectCellAction.toProjectDetail: _onToProjectDetail,
  });
}

void _onAction(Action action, Context<ProjectCellState> ctx) {}

void _onToProjectDetail(Action action, Context<ProjectCellState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  print('项目cell 跳转进去的url=$url');
  print('项目cell 跳转进去的title=$title');
  Navigator.pushNamed(ctx.context, "webView",
      arguments: {"url": url, "title": title});
}
