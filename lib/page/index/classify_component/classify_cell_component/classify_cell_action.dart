import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClassifyCellAction { action }

class ClassifyCellActionCreator {
  static Action onAction() {
    return const Action(ClassifyCellAction.action);
  }
}
