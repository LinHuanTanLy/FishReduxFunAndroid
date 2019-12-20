import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/ProjectTreeBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class ProjectListState implements GlobalBaseState, Cloneable<ProjectListState> {
  List<ProjectTreeCellBean> projectList;
  TabController tabControllerForMenu;

  @override
  ProjectListState clone() {
    return ProjectListState()
      ..themeColor = themeColor
      ..projectList = projectList.toList()
      ..tabControllerForMenu = tabControllerForMenu;
  }

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  int userPoint;
}

ProjectListState initState(Map<String, dynamic> args) {
  return ProjectListState()..projectList = [];
}
