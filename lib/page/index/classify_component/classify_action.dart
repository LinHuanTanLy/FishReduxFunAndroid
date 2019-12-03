import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClassifyAction { action }

class ClassifyActionCreator {
  static Action onAction() {
    return const Action(ClassifyAction.action);
  }
}
