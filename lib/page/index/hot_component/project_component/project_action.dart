import 'package:fish_redux/fish_redux.dart';

enum ProjectAction {
  action,
  initW,
  toProjectPage,
  toWebViewPage,
}

class ProjectActionCreator {
  static Action onAction() {
    return const Action(ProjectAction.action);
  }

  static Action onInitW(double w) {
    return Action(ProjectAction.initW, payload: w);
  }

  static Action onToProjectPage() {
    return Action(ProjectAction.toProjectPage);
  }

  static Action onToWebViewPage(dynamic params) {
    return Action(ProjectAction.toWebViewPage, payload: params);
  }
}
