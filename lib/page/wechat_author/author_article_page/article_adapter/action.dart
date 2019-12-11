import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleListAction { action }

class ArticleListActionCreator {
  static Action onAction() {
    return const Action(ArticleListAction.action);
  }
}
