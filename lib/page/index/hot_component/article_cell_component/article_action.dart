import 'package:fish_redux/fish_redux.dart';

enum ArticleCellAction { action, toWebView }

class ArticleCellActionCreator {
  static Action onAction() {
    return const Action(ArticleCellAction.action);
  }

  static Action onToWebView(dynamic params) {
    return Action(ArticleCellAction.toWebView,payload: params);
  }
}
