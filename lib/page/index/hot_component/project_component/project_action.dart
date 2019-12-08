import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ProjectAction { action, initW }

class ProjectActionCreator {
  static Action onAction() {
    return const Action(ProjectAction.action);
  }

  static Action onInitW(double w) {
    return  Action(ProjectAction.initW, payload: w);
  }
}
