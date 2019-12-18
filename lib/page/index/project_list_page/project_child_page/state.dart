import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProjectChildState implements GlobalBaseState, Cloneable<ProjectChildState> {
  List<ProjectSingleCell> dataSourceForList;
  int cid;
  RefreshController refreshController;
  int pageNum;
  @override
  ProjectChildState clone() {
    return ProjectChildState()
      ..dataSourceForList = dataSourceForList.toList()
      ..cid = cid
      ..pageNum = pageNum
      ..refreshController = refreshController;
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

ProjectChildState initState(Map<String, dynamic> args) {
  return ProjectChildState()
    ..dataSourceForList = []
    ..refreshController = RefreshController()
    ..cid = args['id']
    ..pageNum = 1;
}
