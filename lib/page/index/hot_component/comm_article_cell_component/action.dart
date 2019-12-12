import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommArticleCellAction { action, toWebView }

class CommArticleCellActionCreator {
  static Action onAction() {
    return const Action(CommArticleCellAction.action);
  }

  static Action onToWebView(dynamic params) {
    return Action(CommArticleCellAction.toWebView, payload: params);
  }
}
