import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectTreeBean.dart';

enum ProjectListAction { action, updateProjectMenuList }

class ProjectListActionCreator {
  static Action onAction() {
    return const Action(ProjectListAction.action);
  }

  static Action onUpdateProjectMenuList(List<ProjectTreeCellBean> projectList) {
    return  Action(ProjectListAction.updateProjectMenuList,
        payload: projectList);
  }
}
