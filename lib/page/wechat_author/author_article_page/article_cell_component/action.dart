import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleCellAction { action, toWebViewPage }

class ArticleCellActionCreator {
  static Action onAction() {
    return const Action(ArticleCellAction.action);
  }

  static Action onToWebViewPage(dynamic params) {
    return Action(ArticleCellAction.toWebViewPage, payload: params);
  }
}
