import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_android_fun/domain/entity/ProjectTreeBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/index/project_list_page/project_list_page.dart';
import 'project_list_action.dart';
import 'project_list_state.dart';

Effect<ProjectListState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectListState>>{
    ProjectListAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<ProjectListState> ctx) {}
void _onInitState(Action action, Context<ProjectListState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as StateWithTickerProvider;
  DioUtils.getInstance().doGet('project/tree/json', (data) {
    ProjectTreeBean _bean = ProjectTreeBean.fromJson(data);
    if (_bean != null) {
      ctx.dispatch(
          ProjectListActionCreator.onUpdateProjectMenuList(_bean?.data));
      ctx.state.tabControllerForMenu = TabController(
          length: ctx.state.projectList.length, vsync: tickerProvider);
    }
  });
}
