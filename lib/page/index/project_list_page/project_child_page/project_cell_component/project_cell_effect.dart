import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_android_fun/page/index/project_list_page/project_child_page/project_child_action.dart';
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
  dynamic collect = params['collect'];
  print('项目cell 跳转进去的params=$params');
  print('项目cell 跳转进去的url=$url');
  print('项目cell 跳转进去的title=$title');
  print('项目cell 跳转进去的status=$collect');
  Navigator.pushNamed(
    ctx.context,
    "webView",
    arguments: {
      "url": url,
      "title": title,
      "id": ctx?.state?.projectSingleCell?.id,
      "collect": collect
    },
  ).then((data) {
    print('-------------------返回数据,data is $data');
    if (data != null && ctx?.state?.projectSingleCell?.collect != data) {
      ctx.dispatch(ProjectChildActionCreator.onUpdateCollectStatus({
        'id': ctx?.state?.projectSingleCell?.id,
        "status": data,
      }));
    }
  });
}
