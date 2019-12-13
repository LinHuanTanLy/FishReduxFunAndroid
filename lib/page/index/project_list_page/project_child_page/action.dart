import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';

//TODO replace with your own action
enum ProjectChildAction {
  action,
  updateProjectList,
}

class ProjectChildActionCreator {
  static Action onAction() {
    return const Action(ProjectChildAction.action);
  }

  static Action onUpdateProject(List<ProjectSingleCell> dataSourceForList) {
    return Action(ProjectChildAction.updateProjectList,
        payload: dataSourceForList);
  }
}
