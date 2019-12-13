import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';

enum ProjectChildAction { action, updateProjectList, reFresh, loadMore }

class ProjectChildActionCreator {
  static Action onAction() {
    return const Action(ProjectChildAction.action);
  }

  static Action onUpdateProject(List<ProjectSingleCell> dataSourceForList) {
    return Action(ProjectChildAction.updateProjectList,
        payload: dataSourceForList);
  }

  static Action onRefresh() {
    return const Action(ProjectChildAction.reFresh);
  }

  static Action onLoadmore() {
    return const Action(ProjectChildAction.loadMore);
  }
}
