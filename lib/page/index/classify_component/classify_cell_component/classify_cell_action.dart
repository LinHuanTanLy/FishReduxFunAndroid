import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClassifyCellAction { action, toAuthorPage }

class ClassifyCellActionCreator {
  static Action onAction() {
    return const Action(ClassifyCellAction.action);
  }

  static Action onToAuthorPage(int id) {
    return  Action(ClassifyCellAction.toAuthorPage, payload: id);
  }
}
