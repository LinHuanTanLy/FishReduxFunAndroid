import 'package:fish_redux/fish_redux.dart';

enum ProjectCellAction { action, toProjectDetail,  }

class ProjectCellActionCreator {
  static Action onAction() {
    return const Action(ProjectCellAction.action);
  }



  static Action onToProjectDetail(dynamic params) {
    return Action(ProjectCellAction.toProjectDetail, payload: params);
  }
}
