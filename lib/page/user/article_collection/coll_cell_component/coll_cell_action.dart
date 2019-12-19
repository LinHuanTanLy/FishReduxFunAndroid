import 'package:fish_redux/fish_redux.dart';

enum ArticleCollCellAction { action, toWebView, deleteColl }

class ArticleCollCellActionCreator {
  static Action onAction() {
    return const Action(ArticleCollCellAction.action);
  }

  static Action onToWebView() {
    return const Action(ArticleCollCellAction.toWebView);
  }

  static Action onDelete() {
    return const Action(ArticleCollCellAction.deleteColl);
  }
}
