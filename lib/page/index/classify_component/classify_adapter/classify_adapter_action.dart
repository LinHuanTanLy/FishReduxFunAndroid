import 'package:fish_redux/fish_redux.dart';

enum ClassifyAction { action }

class ClassifyActionCreator {
  static Action onAction() {
    return const Action(ClassifyAction.action);
  }
}
