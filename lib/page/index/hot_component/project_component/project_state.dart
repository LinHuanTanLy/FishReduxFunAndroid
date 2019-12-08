import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';

class ProjectState implements Cloneable<ProjectState> {
  List<ProjectListCellBean> projectListDataSource;
  double screenH;

  double screenW;

  @override
  ProjectState clone() {
    return ProjectState()
      ..projectListDataSource = projectListDataSource
      ..screenH = screenH
      ..screenW = screenW;
  }
}
