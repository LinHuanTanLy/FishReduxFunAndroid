import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleCollCellAction { action, toWebView }

class ArticleCollCellActionCreator {
  static Action onAction() {
    return const Action(ArticleCollCellAction.action);
  }

  static Action onToWebView() {
    return const Action(ArticleCollCellAction.toWebView);
  }
}
