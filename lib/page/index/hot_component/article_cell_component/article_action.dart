import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleCellAction { action }

class ArticleCellActionCreator {
  static Action onAction() {
    return const Action(ArticleCellAction.action);
  }
}
