import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';

class ProjectCellState implements Cloneable<ProjectCellState> {
  ProjectSingleCell projectSingleCell;
  @override
  ProjectCellState clone() {
    return ProjectCellState()..projectSingleCell = projectSingleCell;
  }
}

ProjectCellState initState(Map<String, dynamic> args) {
  return ProjectCellState();
}
