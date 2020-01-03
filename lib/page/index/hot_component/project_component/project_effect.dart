import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'project_action.dart';
import 'project_state.dart';

Effect<ProjectState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectState>>{
    ProjectAction.action: _onAction,
    ProjectAction.toProjectPage: _onToProjectPage,
    ProjectAction.toWebViewPage: _onToWebViewPage,
    Lifecycle.build: _onBuild,
  });
}

void _onAction(Action action, Context<ProjectState> ctx) {}

void _onBuild(Action action, Context<ProjectState> ctx) {
  double w = MediaQuery.of(ctx.context).size.width;
  ctx.dispatch(ProjectActionCreator.onInitW(w));
}

void _onToProjectPage(Action action, Context<ProjectState> ctx) {
  Navigator.pushNamed(ctx.context, 'project_list');
}

void _onToWebViewPage(Action action, Context<ProjectState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  int id = params['id'];
  bool collect = params['collect'];
  Navigator.pushNamed(ctx.context, "webView",
      arguments: {"url": url, "title": title, "id": id, "collect": collect});
}
