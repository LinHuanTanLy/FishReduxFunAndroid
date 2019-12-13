import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProjectChildState implements Cloneable<ProjectChildState> {
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
}

ProjectChildState initState(Map<String, dynamic> args) {
  return ProjectChildState()
    ..dataSourceForList = []
    ..refreshController = RefreshController()
    ..cid = args['id']
    ..pageNum = 1;
}
