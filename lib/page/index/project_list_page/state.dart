import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/ProjectTreeBean.dart';

class ProjectListState implements Cloneable<ProjectListState> {
  List<ProjectTreeCellBean> projectList;
  TabController tabControllerForMenu;
  @override
  ProjectListState clone() {
    return ProjectListState()
      ..projectList = projectList.toList()
      ..tabControllerForMenu = tabControllerForMenu;
  }
}

ProjectListState initState(Map<String, dynamic> args) {
  return ProjectListState()..projectList = [];
}
