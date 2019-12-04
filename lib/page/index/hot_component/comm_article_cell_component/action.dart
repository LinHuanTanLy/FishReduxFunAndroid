import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommArticleCellAction { action }

class CommArticleCellActionCreator {
  static Action onAction() {
    return const Action(CommArticleCellAction.action);
  }
}
