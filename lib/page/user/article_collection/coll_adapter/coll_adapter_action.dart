import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleCollAction { action }

class ArticleCollActionCreator {
  static Action onAction() {
    return const Action(ArticleCollAction.action);
  }
}
