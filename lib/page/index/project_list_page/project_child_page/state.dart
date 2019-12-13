import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';

class ProjectChildState implements Cloneable<ProjectChildState> {
  List<ProjectSingleCell> dataSourceForList;
  int cid;
  @override
  ProjectChildState clone() {
    return ProjectChildState()
      ..dataSourceForList = dataSourceForList.toList()
      ..cid = cid;
  }
}

ProjectChildState initState(Map<String, dynamic> args) {
  return ProjectChildState()
  ..dataSourceForList=[]
  ..cid = args['id'];
}
