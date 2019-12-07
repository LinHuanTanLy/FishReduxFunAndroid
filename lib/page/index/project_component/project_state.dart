import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';

class ProjectState implements Cloneable<ProjectState> {
  List<ProjectListCellBean> projectListDataSource;
  double w=0;
  @override
  ProjectState clone() {
    return ProjectState()..projectListDataSource = projectListDataSource..w=w;
  }
}

ProjectState initState(Map<String, dynamic> args) {
  return ProjectState();
}
